{ pkgs, ... }:
let
  hypno-font = pkgs.stdenvNoCC.mkDerivation {
    name = "hypno-font";
    src = ../../assets/fonts/hypno-font.otf;

    installPhase = ''
      runHook preInstall

      install -Dm644 $src -t $out/share/fonts/opentype

      runHook postInstall
    '';

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