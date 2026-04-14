{ pkgs, ... }:

let
  ryubing-canary = pkgs.appimageTools.wrapType2 rec {
    pname = "ryujinx-canary";
    version = "1.3.269";  
    src = pkgs.fetchurl {
      url = "https://git.ryujinx.app/Ryubing/Canary/releases/download/${version}/ryujinx-canary-${version}-x64.AppImage";
      hash = "sha256-OvqqwStmvDBADOPMHw8G3rJeF1NytvRBepnAOSfTDg4=";
    };
    extraPkgs = pkgs: with pkgs; [
      icu
    ];
  };
in
{
  home.packages = [
    ryubing-canary
  ];
}