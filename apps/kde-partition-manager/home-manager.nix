{ pkgs, ... }:

{
  home.packages = with pkgs.kdePackages; [
    partitionmanager
  ];
}