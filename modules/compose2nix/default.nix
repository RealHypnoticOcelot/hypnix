{ inputs, ... }:
let
  mkContainers = (import ./mkcontainers.nix {
    inherit lib inputs userName hostName;
  });
in
{
  environment.systemPackages = [
    inputs.compose2nix.packages.x86_64-linux.default
  ];
  imports = mkContainers [
    "terraria"
  ];
}