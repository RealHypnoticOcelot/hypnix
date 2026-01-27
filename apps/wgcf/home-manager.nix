{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wgcf
  ];
}