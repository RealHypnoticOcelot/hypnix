{ pkgs, ... }:

{
  home.packages = with pkgs; [
    deltachat-desktop
  ];
}