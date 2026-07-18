{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kdePackages.kmouth
    espeak-ng
  ];
}