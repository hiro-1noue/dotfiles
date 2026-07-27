{ pkgs, ... }:

{
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
      qt6Packages.fcitx5-configtool
      fcitx5-mellow-themes
      fcitx5-tokyonight
      catppuccin-fcitx5
      fcitx5-nord
      fcitx5-rose-pine
      fcitx5-material-color
    ];
  };

  environment.pathsToLink = [ "/share/fcitx5" ];
}
