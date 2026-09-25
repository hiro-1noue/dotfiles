{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # system utilities
    file
    wget
    xdg-utils
    zip
    unzip
    p7zip

    # build tools
    cargo
    gcc
    (python313.withPackages (pythonPackages: with pythonPackages; [
      numpy
      pandas
      matplotlib
      beautifulsoup4
      requests
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
    john
    nmap
    nssTools
    sqlmap
    thc-hydra
    wireshark

    claude-code
  ];
}
