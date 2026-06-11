{ pkgs, config, lib, userName, ... }:

#CURRENTLY NOT FUNCTIONAL, REASON UNKNOWN

{
  environment.systemPackages = with pkgs; [
    winboat
  ];
  virtualisation = {
    docker.enable = true;
    # podman = {
    #   enable = true;
    #   dockerCompat = true;
    #   defaultNetwork.settings.dns_enabled = true; # Required for containers under podman-compose to be able to talk to each other.
    # };
  };
  users.users.${userName}.extraGroups = [
    "docker"
    # "podman"
  ];
}