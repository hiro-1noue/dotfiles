{ pkgs, ... }:
let
  setWallpaper = pkgs.writeShellScript "set-wallpaper" ''
    WALLPAPER="$HOME/.local/share/wallpapers/cafe.jpeg"

    set_wallpaper() {
      monitors_json=$(${pkgs.hyprland}/bin/hyprctl monitors -j)
      echo "$monitors_json" | ${pkgs.jq}/bin/jq -c '.[]' | while IFS= read -r monitor_json; do
        monitor=$(echo "$monitor_json" | ${pkgs.jq}/bin/jq -r '.name')
        width=$(echo "$monitor_json" | ${pkgs.jq}/bin/jq -r '.width')
        height=$(echo "$monitor_json" | ${pkgs.jq}/bin/jq -r '.height')

        cropped=$(mktemp --suffix=.jpg)
        ${pkgs.imagemagick}/bin/convert "$WALLPAPER" \
          -resize "''${width}x''${height}^" \
          -gravity Center \
          -extent "''${width}x''${height}" \
          "$cropped"

        ${pkgs.awww}/bin/awww img \
          --resize no \
          --outputs "$monitor" \
          --transition-duration 0.5 \
          --transition-fps 60 \
          --transition-step 90 \
          "$cropped"

        rm -f "$cropped"
      done
    }

    until ${pkgs.awww}/bin/awww query > /dev/null 2>&1; do
      sleep 0.1
    done

    set_wallpaper
    ${pkgs.socat}/bin/socat -U - \
      UNIX-CONNECT:"$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" | \
      while IFS= read -r line; do
        if [[ "$line" == monitoradded* ]]; then
          sleep 0.3
          set_wallpaper
        fi
      done
  '';
in
{
  home.packages = [ pkgs.awww pkgs.socat pkgs.jq pkgs.imagemagick ];

  home.file.".local/share/wallpapers/cafe.jpeg".source = ./wallpapers/cafe.jpeg;
  home.file.".local/bin/set-wallpaper" = {
    source = setWallpaper;
    executable = true;
  };
}
