{ pkgs, inputs, ... }:
let
  system = pkgs.stdenv.hostPlatform.system;
  upr-fvxPkg = inputs.upr-fvx.packages.${system}.default;
in {
  home.packages = [
    upr-fvxPkg
  ];
}