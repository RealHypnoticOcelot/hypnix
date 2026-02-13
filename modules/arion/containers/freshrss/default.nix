{ userName, config, ... }:
let 
  serviceName = "freshrss";
  volumePath = "/home/${userName}/services/${serviceName}";
in
{
  project.name = serviceName;
  services.${serviceName} = {
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