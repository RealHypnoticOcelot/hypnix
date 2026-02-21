{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    feh
  ];
}