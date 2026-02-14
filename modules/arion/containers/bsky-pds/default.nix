{ userName, config, projectName, profileName, volumePath, ... }:
{
  project.name = projectName;
  services.profileName = {
    service = {
      image = "ghcr.io/bluesky-social/pds:latest";
      restart = "unless-stopped";
      env_file = [
        "${volumePath}/pds.env"
      ];
      volumes = [
        "${volumePath}/pds:/pds"
      ];
    };
  };
}