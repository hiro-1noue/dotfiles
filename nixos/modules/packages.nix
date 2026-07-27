{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # system utilities
    file
    wget
    xdg-utils
    zip
    unzip

    # build tools
    cargo
    gcc
    python3

    # cloud CLIs
    awscli2
    azure-cli

    # network tools
    net-snmp
    nfs-utils
    openvpn
    samba

    # security tools
    burpsuite
    ghidra
    gobuster
    hydra
    john
    nmap
    sqlmap
    wireshark

    claude-code
  ];
}
