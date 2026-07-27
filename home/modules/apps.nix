{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # terminal utilities
    brightnessctl
    fastfetch
    imv
    vim
    xclip
    yazi

    # GUI applications
    firefox
    hyprland
    kitty
    vesktop
    waybar
    wofi

    # development
    nodejs_22
    tree-sitter

    # LSP servers
    clang-tools
    lua-language-server
    rust-analyzer
    typescript-language-server
  ];
}
