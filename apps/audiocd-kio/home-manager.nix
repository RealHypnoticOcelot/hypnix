{ pkgs, ... }:

{
  home.packages = with pkgs.kdePackages; [
    audiocd-kio
  ];
}