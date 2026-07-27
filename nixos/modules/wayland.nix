{ pkgs, ... }:

{
  hardware.graphics.enable = true;

  programs.xwayland.enable = true;
  programs.dconf.enable = true;

  xdg.portal = {
    enable = true;
    config.common.default = "*";
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
  };
}
