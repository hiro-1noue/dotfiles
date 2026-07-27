{ ... }:

{
  xdg.configFile = {
    "hypr/hyprland.conf".source = ../../config/hypr/hyprland.conf;
    "kitty/kitty.conf".source = ../../config/kitty/kitty.conf;
    "starship.toml".source = ../../config/starship.toml;
    "waybar/config.jsonc".source = ../../config/waybar/config.jsonc;
    "waybar/style.css".source = ../../config/waybar/style.css;
    "wofi/style.css".source = ../../config/wofi/style.css;
  };
}
