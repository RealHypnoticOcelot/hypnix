{ pkgs, userName, ... }:
{
  environment.systemPackages = [
    # Do install the docker CLI to talk to podman.
    # Not needed when virtualisation.docker.enable = true;
    pkgs.docker-client
  ];

  virtualisation.podman = {
    enable = true;
    dockerSocket.enable = true;
    defaultNetwork.settings = {
      dns_enabled = true; # Allows containers to communicate with each other
    };
  };

  users.users.${userName} = {
    extraGroups = [
      "podman"
    ];
  };
}