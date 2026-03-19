{ pkgs, ... }:

let
  orion-flatpak = pkgs.fetchurl {
    url = "https://orionbrowser.com/download/oriongtk-early-beta";
    hash = "sha256-bX2k0SPyPuaGhYBKJfEn/QnIK2BLBfDjaku8eGfQ+Z4=";
  };
in
{
  services.flatpak = {
    packages = [
      ":${orion-flatpak}.flatpak" # Need to add .flatpak, because the url doesn't include it?
    ];
  };
}