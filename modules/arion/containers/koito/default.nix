{ userName, config, projectName, profileName, volumePath, ... }:
{
  project.name = projectName;
  services.${profileName} = {
    service = {
      container_name = "${profileName}";
      image = "gabehf/koito:latest";
      restart = "unless-stopped";
      env_file = [
        config.sops.templates.${profileName}.path
      ];
      volumes = [
        "${volumePath}/data:/etc/koito"
      ];
      depends_on = [
        "${profileName}_db"
      ];
    };
  };
  services."${profileName}_db" = {
    service = {
      container_name = "${profileName}_db";
      image = "postgres:16";
      environment = {
        POSTGRES_DB = "koitodb";
        POSTGRES_USER = "postgres";
      };
      env_file = [
        config.sops.templates."${profileName}_db".path
      ];
      volumes = [
        "${volumePath}/db:/var/lib/postgresql/data"
      ];
    };
  };
}