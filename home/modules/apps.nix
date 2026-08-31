{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # terminal utilities
    brightnessctl
    fastfetch
    hyprshot
    imv
    neovim
    vim
    xclip
    yazi

    # GUI applications
    firefox
    nyxt
    hyprland
    kitty
    slack
    vesktop
    waybar
    fuzzel
    zoom-us

    # development
    codex
    nodejs_22
    tree-sitter
    uv

    # ctf
    pwntools
    gdb

    # LSP servers
    clang-tools
    lua-language-server
    rust-analyzer
    typescript-language-server
  ];
}
