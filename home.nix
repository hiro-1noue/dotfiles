{ config, pkgs, ... }:

{
  home.username = "hiro";
  home.homeDirectory = "/home/hiro";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

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
    enable = true;
    defaultEditor = true;
    withPython3 = true;
    withRuby = true;
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
