{ config, pkgs, ... }:

{
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

  xdg.configFile = {
    "hypr/hyprland.conf".source = ../config/hypr/hyprland.conf;
    "kitty/kitty.conf".source = ../config/kitty/kitty.conf;
    "starship.toml".source = ../config/starship.toml;
    "waybar/config.jsonc".source = ../config/waybar/config.jsonc;
    "wofi/style.css".source = ../config/wofi/style.css;
    "fcitx5/profile".text = ''
      [Groups/0]
      Name=Default
      Default Layout=jp
      DefaultIM=mozc

      [Groups/0/Items/0]
      Name=keyboard-jp
      Layout=

      [Groups/0/Items/1]
      Name=mozc
      Layout=

      [GroupOrder]
      0=Default
    '';
  };

  xdg.configFile."nvim".enable = false;

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = "Adwaita-dark";
    };
  };

  gtk = {
    enable = true;

    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };

    gtk4.theme = config.gtk.theme;

    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
  };

  home.packages = with pkgs; [
    bat
    brightnessctl
    cmatrix
    eza
    fastfetch
    firefox
    gcc
    imv
    kitty
    ripgrep
    vim
    wofi
    xclip
    yazi
    nodejs_22
    discord
    nyancat
  ];

  programs.bat.enable = true;

  programs.eza = {
    enable = true;
    enableFishIntegration = true;
    git = true;
    icons = "auto";
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
  };

  programs.git = {
    enable = true;
    settings.user.name = "hiro-1noue";
  };

  programs.neovim = {
    enable = false;
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };
}
