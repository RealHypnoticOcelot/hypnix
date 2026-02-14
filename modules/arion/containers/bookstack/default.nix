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
        DB_HOST = "${profileName}_db";
        DB_PORT = 3306;
        DB_USER = "bookstack";
        DB_DATABASE = "bookstackapp";
        EXPORT_PAGE_SIZE = "letter";
        APP_DEFAULT_DARK_MODE = "true";
      };
      env_file = [
        config.sops.templates."${profileName}".path
      ];
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
        MYSQL_DATABASE = "bookstackapp";
        MYSQL_USER = "bookstack";
      };
      env_file = [
        config.sops.templates."${profileName}_db".path
      ];
      volumes = [
        "${volumePath}/db:/config"
      ];
    };
  };
}