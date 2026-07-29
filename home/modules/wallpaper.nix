{ pkgs, ... }:
{
  home.packages = [ pkgs.awww ];

  home.file.".local/share/wallpapers/cafe.jpeg".source = ./wallpapers/cafe.jpeg;
}
