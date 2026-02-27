{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kdePackages.skanlite
  ];
}