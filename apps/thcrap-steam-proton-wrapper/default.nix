{ pkgs, config, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    thcrap-steam-proton-wrapper
    libarchive
  ];
}