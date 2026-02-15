{ userName, config, projectName, profileName, volumePath, ... }:
{
  project.name = projectName;
  services.${profileName} = {
    service = {
      container_name = "${profileName}";
      image = "vaultwarden/server:latest";
      restart = "unless-stopped";
      volumes = [
        "${volumePath}/data:/data"
      ];
      environment = {
        SMTP_PORT = "587";
        SMTP_SECURITY = "starttls";
      };
      env_file = [
        config.sops.templates.${profileName}.path
      ];
    };
  };
}