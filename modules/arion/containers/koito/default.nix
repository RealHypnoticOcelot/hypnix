{ userName, config, ... }:
let 
  serviceName = "koito";
  volumePath = "/home/${userName}/services/${serviceName}";
in
{
  project.name = serviceName;
  services.${serviceName} = {
    service = {
      image = "gabehf/koito:latest";
      restart = "unless-stopped";
      environment = {
        KOITO_DATABASE_URL= "postgres://postgres:" + config.sops.secrets.koito-db_password + "@db:5432/koitodb";
        KOITO_ALLOWED_HOSTS = config.sops.secrets.koito-allowed_hosts;
      };
      volumes = [
        "${volumePath}/data:/etc/koito"
      ];
      depends_on = [
        "${serviceName}_db"
      ];
    };
  };
  services."${serviceName}_db" = {
    service = {
      image = "postgres:16";
      environment = {
        POSTGRES_DB = "koitodb";
        POSTGRES_USER = "postgres";
        POSTGRESS_PASSWORD = config.sops.secrets.koito-db_password
      };
      volumes = [
        "${volumePath}/db:/var/lib/postgresql/data"
      ];
    };
  };
}