{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # terminal utilities
    brightnessctl
    fastfetch
    imv
    neovim
    vim
    xclip
    yazi

    # GUI applications
    firefox
    hyprland
    kitty
    vesktop
    waybar
    fuzzel

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
