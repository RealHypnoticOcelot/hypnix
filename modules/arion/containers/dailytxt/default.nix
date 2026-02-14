{ userName, config, projectName, profileName, volumePath, ... }:
{
  project.name = projectName;
  services.${profileName} = {
    service = {
      container_name = "${profileName}";
      image = "phitux/dailytxt:latest";
      restart = "unless-stopped";
      volumes = [
        "${volumePath}/data:/data"
      ];
      environment = {
        INDENT = 4;
        ALLOW_REGISTRATION = "false";
        LOGOUT_AFTER_DAYS = 30;
      };
      env_file = [
        config.sops.templates."${profileName}".path
      ];
    };
  };
}