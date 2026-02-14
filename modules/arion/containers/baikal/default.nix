{ userName, config, projectName, profileName, volumePath, ... }:
{
  project.name = projectName;
  services.${profileName} = {
    service = {
      container_name = "${profileName}";
      image = "ckulka/baikal:nginx";
      restart = "unless-stopped";
      volumes = [
        "${volumePath}/config:/var/www/baikal/config"
        "${volumePath}/data:/var/www/baikal/Specific"
      ];
    };
  };
}