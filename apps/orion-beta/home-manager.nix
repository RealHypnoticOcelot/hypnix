{ pkgs, ... }:

let
  orion-flatpak = pkgs.fetchurl {
    url = "https://orionbrowser.com/download/oriongtk-early-beta";
    hash = "sha256-bX2k0SPyPuaGhYBKJfEn/QnIK2BLBfDjaku8eGfQ+Z4=";
    name = "oriongtk-earlybeta-1.flatpak";
  };
in
{
  services.flatpak = {
    packages = [
      ":${orion-flatpak}"
    ];
  };
}