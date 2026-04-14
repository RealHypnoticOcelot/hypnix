{ pkgs, builtins ... }:

let
  latest-release = builtins.fromJSON (fetchurl {
    url = "https://git.ryujinx.app/api/v1/repos/Ryubing/Canary/releases/latest";
  });
  ryubing-canary = pkgs.fetchurl {
    url = "https://git.ryujinx.app/Ryubing/Canary/releases/download/${latest-release.tag_name}/ryujinx-canary-${latest-release.tag_name}-linux_x64.tar.gz";
    hash = "sha256-bX2k0SPyPuaGhYBKJfEn/QnIK2BLBfDjaku8eGfQ+Z4=";
    name = "oriongtk-earlybeta-1.flatpak";
  };
in
{
  home.packages = [
    ryubing-canary
  ];
}