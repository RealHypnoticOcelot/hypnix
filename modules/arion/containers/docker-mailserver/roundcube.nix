{ userName, config, ... }:
let 
  serviceName = "docker-mailserver";
  volumePath = "/home/${userName}/services/${serviceName}";
in
{
  project.name = serviceName;
  services."roundcube" = {
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
        ROUNDCUBEMAIL_DEFAULT_HOST = "tls://" + config.sops.secrets.dms-hostname;
        ROUNDCUBEMAIL_SMTP_SERVER = "tls://" + config.sops.secrets.dms-hostname;
        ROUNDCUBEMAIL_UPLOAD_MAX_FILESIZE = "100M";
        ROUNDCUBEMAIL_COMPOSER_PLUGINS = "roundcube/carddav";
        ROUNDCUBEMAIL_PLUGINS = "carddav";
      };
    }
  }
}