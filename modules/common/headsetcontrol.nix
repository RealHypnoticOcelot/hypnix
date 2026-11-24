{ pkgs, ... }:
{
  home.packages = with pkgs; [
    headsetcontrol
  ];
}