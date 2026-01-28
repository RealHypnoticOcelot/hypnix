{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kdePackages.merkuro
    kdePackages.kcontacts # Library for working with contacts that Merkuro uses for the contacts widget
  ];
}