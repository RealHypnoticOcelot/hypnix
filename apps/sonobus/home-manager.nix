{ pkgs, ... }:

{
  home.packages = with pkgs; [
    sonobus
  ];
}