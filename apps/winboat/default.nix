{ pkgs, config, lib, ... }:

{
  virtualization.docker.enable = true;
  environment.systemPackages = with pkgs; [
    winboat
  ];
}