{ pkgs, userName, ... }:
{
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