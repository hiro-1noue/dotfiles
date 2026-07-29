{ ... }:

{
  imports = [
    ./modules/shell.nix
    ./modules/apps.nix
    ./modules/gtk.nix
    ./modules/dotfiles.nix
    ./modules/input-method.nix
    ./modules/wallpaper.nix
  ];

  home.username = "hiro";
  home.homeDirectory = "/home/hiro";
  home.stateVersion = "25.05";

  home.sessionVariables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    SDL_IM_MODULE = "fcitx";
    GLFW_IM_MODULE = "ibus";
    INPUT_METHOD = "fcitx";
  };

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    settings.user.name = "hiro-1noue";
  };
}
