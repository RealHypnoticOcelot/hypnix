{ userName, config, projectName, profileName, volumePath, ... }:
{
  project.name = projectName;
  services.profileName = {
    service = {
      image = "gabehf/koito:latest";
      restart = "unless-stopped";
      environment = {
        KOITO_DATABASE_URL= "postgres://postgres:" + config.sops.templates."${projectName}-db_password".path + "@db:5432/koitodb";
        KOITO_ALLOWED_HOSTS = config.sops.templates."koito-allowed_hosts".path;
      };
      volumes = [
        "${volumePath}/data:/etc/koito"
      ];
      depends_on = [
        "${projectName}_db"
      ];
    };
  };
  services."${projectName}_db" = {
    service = {
      image = "postgres:16";
      environment = {
        POSTGRES_DB = "koitodb";
        POSTGRES_USER = "postgres";
        POSTGRES_PASSWORD = config.sops.templates."${projectName}-db_password".path;
      };
      volumes = [
        "${volumePath}/db:/var/lib/postgresql/data"
      ];
    };
  };
}