{ userName, config, projectName, profileName, volumePath, ... }:
{
  project.name = projectName;
  services.${profileName} = {
    service = {
      container_name = "${profileName}";
      image = "deluan/navidrome:latest";
      restart = "unless-stopped";
      volumes = [
        "${volumePath}/data:/usr/share/nginx/html"
      ];
    };
  };
}