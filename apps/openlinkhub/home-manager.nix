{ pkgs, ... }:

{
  home.packages = with pkgs; [
    openlinkhub
  ];
}