{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kdePackages.merkuro
    kdePackages.kcontacts # Library for working with contacts that Merkuro uses for the contacts widget
    kdePackages.kdepim-runtime # I think it needs this, but I can't tell!
  ];
}