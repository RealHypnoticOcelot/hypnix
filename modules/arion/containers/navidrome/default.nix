{ userName, config, projectName, profileName, volumePath, ... }:
{
  project.name = projectName;
  services.${profileName} = {
    service = {
      container_name = "${profileName}";
      image = "deluan/navidrome:latest";
      restart = "unless-stopped";
      environment = {
        ND_SCANSCHEDULE = "1h";
        ND_ENABLESHARING = "true";
        ND_DEFAULTTHEME = "Spotify-ish";
      };
      env_file = [
        config.sops.templates.${profileName}.path
      ];
      volumes = [
        "/home/${userName}/Music:/music:ro" # ~/Music, read-only
        "${volumePath}/data:/data"
      ];
    };
  };
}