{ pkgs, inputs, ... }:
let
  system = pkgs.stdenv.hostPlatform.system;
  cc3dsfsPkg = inputs.cc3dsfs.packages.${system}.default;
in {
  config.services.udev.packages = [cc3dsfsPkg];
}