{ pkgs, ... }:
{
  config.services.udev.packages = with pkgs; [
    openlinkhub
  ];
}