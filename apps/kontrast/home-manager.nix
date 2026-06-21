{ pkgs, ... }:

{
  home.packages = with pkgs.kdePackages; [
    kontrast
  ];
}