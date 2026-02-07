{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kdePackages.kget
  ];
}