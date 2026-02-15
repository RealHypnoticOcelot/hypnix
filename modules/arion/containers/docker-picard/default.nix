{ userName, config, projectName, profileName, volumePath, ... }:
{
  project.name = projectName;
  services.${profileName} = {
    service = {
      container_name = "${profileName}";
      image = "mikenye/picard:latest";
      restart = "unless-stopped";
      volumes = [
        "${volumePath}/config:/config"
        "/home/${userName}/Music:/music" # ~/Music
      ];
      env_file = [
        config.sops.templates.${profileName}.path
      ];
    };
  };
}