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
    (python313.withPackages (pythonPackages: with pythonPackages; [
      numpy
      pandas
      matplotlib
    ]))

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
    nssTools
    sqlmap
    wireshark

    claude-code
  ];
}
