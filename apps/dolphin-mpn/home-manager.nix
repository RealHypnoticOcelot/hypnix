{ pkgs, ... }:

let
  dolphin-mpn-flatpak = pkgs.fetchurl {
    url = "https://github.com/MarioPartyNetplay/Dolphin-MPN/releases/latest/download/DolphinMPN-flatpak-linux-x86_64.flatpak";
    hash = "sha256-AXULW79dwh2hKxMCPVlYB1cwjspwPauMTiksPZr9SfY=";
  };
in
{
  services.flatpak = {
    packages = [
      ":${dolphin-mpn-flatpak}"
    ];
  };
}