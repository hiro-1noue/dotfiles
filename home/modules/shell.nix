{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
    shellAliases = {
      python = "/run/current-system/sw/bin/python";
      python3 = "/run/current-system/sw/bin/python3";
    };
  };

  home.sessionPath = [ "$HOME/bin" ];

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.bat.enable = true;

  programs.eza = {
    enable = true;
    enableFishIntegration = true;
    git = true;
    icons = "auto";
  };

  home.packages = with pkgs; [
    ripgrep
    cmatrix
    nyancat
    glow
  ];
}
