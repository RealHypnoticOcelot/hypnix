{ pkgs, ... }:

{
  home.packages = with pkgs.kdePackages; [
    kweather
  ];
}