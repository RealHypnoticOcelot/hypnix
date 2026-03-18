{ pkgs, ... }:

let
  orion-flatpak = pkgs.fetchurl {
    url = "https://orionbrowser.com/download/oriongtk-early-beta";
    hash = "sha256-lTeyxzJNQeMdu1IVdovNMtgn77jRIhSybLdMbTkf2Ww=";
  };
in
{
  services.flatpak = {
    packages = [
      ":${orion-flatpak}"
    ];
  };
}