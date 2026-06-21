{ pkgs, ... }:

{
  home.packages = with pkgs.kdePackages; [
    audex
  ];
}