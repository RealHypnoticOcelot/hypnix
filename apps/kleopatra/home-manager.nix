{ pkgs, ... }:

{
  home.packages = with pkgs.kdePackages; [
    kleopatra
  ];
}