{ userName, config, projectName, profileName, volumePath, ... }:
{
  project.name = projectName;
  services.${profileName} = {
    service = {
      container_name = "${profileName}";
      image = "lscr.io/linuxserver/bookstack";
      restart = "unless-stopped";
      environment = {
        PUID = 1000;
        GUID = 1000;
        TZ = "America/New_York";
        APP_URL = config.sops.templates."${projectName}-app_url".path;
        DB_HOST = "${profileName}_db";
        DB_PORT = 3306;
        DB_USER = "bookstack";
        DB_PASSWORD = config.sops.templates."${projectName}-db_password".path;
        DB_DATABASE = "bookstackapp";
        EXPORT_PAGE_SIZE = "letter";
        APP_DEFAULT_DARK_MODE = "true";
      };
      volumes = [
        "${volumePath}/config:/config"
      ];
      depends_on = [
        "${profileName}_db"
      ];
    };
  };
  services."${profileName}_db" = {
    service = {
      container_name = "${profileName}_db";
      image = "lscr.io/linuxserver/mariadb";
      environment = {
        PUID = 1000;
        GUID = 1000;
        TZ = "America/New_York";
        FILE__MYSQL_ROOT_PASSWORD = config.sops.templates."${projectName}-db_password".path;
        MYSQL_DATABASE = "bookstackapp";
        MYSQL_USER = "bookstack";
        FILE__MYSQL_PASSWORD = config.sops.templates."${projectName}-db_password".path; 
      };
      volumes = [
        "${volumePath}/db:/config"
      ];
    };
  };
}