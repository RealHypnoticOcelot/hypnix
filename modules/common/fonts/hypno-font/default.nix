{ lib, pkgs, ... }:
let
  hypno-font = pkgs.stdenvNoCC.mkDerivation {
    name = "hypno-font";
    executable = ../../../../assets/fonts/hypno-font/Hypnoticocelot-Regular.otf;

    installPhase = ''
      runHook preInstall

      install -Dm644 $executable -t $out/share/fonts/opentype

      runHook postInstall
    '';

    phases = [ "installPhase" ]; # Removes all phases except installPhase, otherwise it tries to unzip it

    meta = {
      description = "Custom font based off of my handwriting!";
      license = lib.licenses.gpl3;
      platforms = lib.platforms.all;
    };
  };
in
{
  fonts.packages = with pkgs; [
    hypno-font
  ];
}