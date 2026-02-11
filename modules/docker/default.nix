{ ... }:
{
  virtualisation.docker = {
    # Disabling the system wide Docker daemon
    enable = false;

    rootless = {
      enable = true;
      setSocketVariable = true; # Point DOCKER_HOST to rootless Docker instance for normal users by default.
      # Optionally customize rootless Docker daemon settings
      # daemon.settings = {
      #   dns = [ "1.1.1.1" "8.8.8.8" ];
      #   registry-mirrors = [ "https://mirror.gcr.io" ];
      # };
    };
  };
}