{ config, pkgs, lib, inputs, userName, hostName, ... }:

let
  mkContainers = (import ./mkcontainers.nix {
    inherit lib inputs userName hostName;
  }); #mkHost is the function that generates the system using the profiles and modules we specify
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
    backend =
      if (config.virtualisation.podman.enable && config.virtualisation.podman.dockerSocket.enable)
      then "podman-socket"
      else "docker";
    services = mkContainers {
      profiles = [
        "terraria"
      ];
    };
  };
}