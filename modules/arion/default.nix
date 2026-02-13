{ config, pkgs, lib, inputs, userName, hostName, ... }:

let
  mkContainers = (import ./mkcontainers.nix {
    inherit config lib inputs userName hostName;
  });
  sopsProfiles = (import ./sopsprofiles.nix {
    inherit config lib inputs userName hostName;
  });
  selectedContainers = [
    "koito"
  ];
in
{
  environment.systemPackages = with pkgs; [
    arion
    # Do install the docker CLI to talk to podman.
    # Not needed when virtualisation.docker.enable = true;
    docker-client
  ];
  
  imports = lib.flatten (
    map (
      profile:
      lib.optionals (
        sopsProfiles ? ${profile}
        # Checks if profile exists within moduleProfiles, then checks if moduleProfiles.{$profile}
        # is valid, then checks if moduleProfiles.${profile} has a "system" attribute
      ) sopsProfiles.${profile}
      # If conditions are met, return moduleProfiles.{$profile}.system
    ) selectedContainers
  );
  # Arion works with Docker, but for NixOS-based containers, you need Podman
  # since NixOS 21.05. Probably just use Podman, then!
    virtualisation.arion = {
    backend = "podman-socket";
    projects = mkContainers selectedContainers;
  };
}