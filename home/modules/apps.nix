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
    google-chrome
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
    unrar

    # ctf
    pwntools # pwn
    gdb
    binwalk # steg
    steghide
    stegseek
    zsteg
    ffuf # fuzz
    hashcat # hash

    # LSP servers
    clang-tools
    lua-language-server
    rust-analyzer
    typescript-language-server
  ];
}
