{ pkgs, ... }:

let
  dolphin-mpn-flatpak = pkgs.fetchurl {
    url = "https://github.com/MarioPartyNetplay/Dolphin-MPN/releases/download/latest/DolphinMPN-flatpak-linux-x86_64.flatpak";
    hash = "sha256-bX2k0SPyPuaGhYBKJfEn/QnIK2BLBfDjaku8eGfQ+Z4=";
  };
in
{
  services.flatpak = {
    packages = [
      ":${dolphin-mpn-flatpak}"
    ];
  };
}