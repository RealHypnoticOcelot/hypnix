{ pkgs, ... }:

{
  home.packages = with pkgs.kdePackages; [
    isoimagewriter
  ];
}