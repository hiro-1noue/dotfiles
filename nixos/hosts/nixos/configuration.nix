{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/locale.nix
    ../../modules/audio.nix
    ../../modules/wayland.nix
    ../../modules/input-method.nix
    ../../modules/fonts.nix
    ../../modules/packages.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [ 1234 ];
  networking.extraHosts = ''
    10.129.33.105 connected.htb
    10.129.94.45 thetoppers.htb
    10.129.94.45 s3.thetoppers.htb
  '';

  virtualisation.docker.enable = true;

  users.users.hiro = {
    isNormalUser = true;
    description = "hiro";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.fish;
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.getty.autologinUser = "hiro";

  programs.fish.enable = true;

  system.stateVersion = "25.05";
}
