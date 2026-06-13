{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Tokyo";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ja_JP.UTF-8";
    LC_IDENTIFICATION = "ja_JP.UTF-8";
    LC_MEASUREMENT = "ja_JP.UTF-8";
    LC_MONETARY = "ja_JP.UTF-8";
    LC_NAME = "ja_JP.UTF-8";
    LC_NUMERIC = "ja_JP.UTF-8";
    LC_PAPER = "ja_JP.UTF-8";
    LC_TELEPHONE = "ja_JP.UTF-8";
    LC_TIME = "ja_JP.UTF-8";
  };

  services.xserver.xkb = {
    layout = "jp";
    variant = "";
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  security.rtkit.enable = true;

  users.users.hiro = {
    isNormalUser = true;
    description = "hiro";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.05";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  hardware.graphics.enable = true;

  services.getty.autologinUser = "hiro";

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

  programs.fish.enable = true;
  users.users.hiro.shell = pkgs.fish;

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

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts-cjk-sans
  ];

  environment.systemPackages = with pkgs; [
    kitty
    wofi
    waybar
    hyprland
    fastfetch
    cmatrix
    git
    wget
    imv
    vim
    neovim
    eza
    ripgrep
    zoxide
    starship
    bat
    xclip
    yazi
    firefox
    brightnessctl
    cargo
    gcc
    nmap
    gobuster
    burpsuite
    ghidra
    tree-sitter
  ];

}
