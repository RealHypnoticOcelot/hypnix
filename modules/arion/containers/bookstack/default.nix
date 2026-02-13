{ userName, config, ... }:
let 
  serviceName = "bookstack";
  volumePath = "/home/${userName}/services/${serviceName}";
in
{
  project.name = serviceName;
  services.${serviceName} = {
    service = {
      image = "lscr.io/linuxserver/bookstack";
      restart = "unless-stopped";
      environment = {
        PUID = 1000;
        GUID = 1000;
        TZ = "America/Detroit";
        FILE__APP_URL = config.sops.secrets.bookstack-appurl.path;
        DB_HOST = "${serviceName}_db";
        DB_PORT = 3306;
        DB_USER = "bookstack";
        FILE__DB_PASSWORD = config.sops.secrets.bookstack-password.path;
        DB_DATABASE = "bookstackapp";
        EXPORT_PAGE_SIZE = "letter";
        APP_DEFAULT_DARK_MODE = "true";
      };
      volumes = [
        "${volumePath}/config:/config"
      ];
      depends_on = [
        "${serviceName}_db"
      ];
    };
  };
  services."${serviceName}_db" = {
    service = {
      image = "lscr.io/linuxserver/mariadb";
      environment = {
        PUID = 1000;
        GUID = 1000;
        TZ = "America/Detroit";
        FILE__MYSQL_ROOT_PASSWORD = config.sops.secrets.bookstack-password.path;
        MYSQL_DATABASE = "bookstackapp";
        MYSQL_USER = "bookstack";
        FILE__MYSQL_PASSWORD = config.sops.secrets.bookstack-password.path; 
      };
      volumes = [
        "${volumePath}/db:/config"
      ];
    };
  };
}