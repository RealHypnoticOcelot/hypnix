{ userName, config, projectName, profileName, volumePath, ... }:
{
  project.name = projectName;
  services.${profileName} = {
    service = {
      image = "roundcube/roundcubemail:latest";
      restart = "unless-stopped";
      volumes = [
        "${volumePath}/roundcube/www:/var/www/html"
        "${volumePath}/roundcube/db/sqlite:/var/roundcube/db"
      ];
      environment = {
        ROUNDCUBEMAIL_DB_TYPE = "sqlite";
        ROUNCUBEMAIL_SKIN = "elastic";
        ROUNDCUBEMAIL_DEFAULT_HOST = "tls://" + config.sops.templates."${projectName}-hostname".path;
        ROUNDCUBEMAIL_SMTP_SERVER = "tls://" + config.sops.templates."${projectName}-hostname".path;
        ROUNDCUBEMAIL_UPLOAD_MAX_FILESIZE = "100M";
        ROUNDCUBEMAIL_COMPOSER_PLUGINS = "roundcube/carddav";
        ROUNDCUBEMAIL_PLUGINS = "carddav";
      };
    }
  }
}