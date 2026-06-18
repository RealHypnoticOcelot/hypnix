{ pkgs, ... }:

{
  home.packages = with pkgs.kdePackages; [
    oxygen
    oxygen-icons
    oxygen-sounds
  ];
}