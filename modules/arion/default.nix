{ config, pkgs, lib, inputs, userName, hostName, ... }:

let
  mkContainers = (import ./mkcontainers.nix {
    inherit lib inputs userName hostName;
  });
in
{
  environment.systemPackages = with pkgs; [
    arion
    # Do install the docker CLI to talk to podman.
    # Not needed when virtualisation.docker.enable = true;
    docker-client
  ];

  # Arion works with Docker, but for NixOS-based containers, you need Podman
  # since NixOS 21.05. Probably just use Podman, then!
    virtualisation.arion = {
    backend = "podman-socket";
    projects = mkContainers [
      "terraria"
    ];
  };
}