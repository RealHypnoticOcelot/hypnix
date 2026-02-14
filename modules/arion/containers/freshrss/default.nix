{ userName, config, projectName, profileName, volumePath, ... }:
{
  project.name = projectName;
  services.profileName = {
    service = {
      image = "freshrss/freshrss:latest";
      restart = "unless-stopped";
      volumes = [
        "${volumePath}/data:/var/www/FreshRSS/data"
        "${volumePath}/extensions:/var/www/FreshRSS/extensions"
      ];
      environment = {
        TZ = "America/New_York";
        CRON_MIN = "3,33";
      };
    };
  };
}