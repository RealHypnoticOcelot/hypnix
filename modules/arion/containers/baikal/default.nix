{ userName, config, ... }:
let 
  serviceName = "baikal";
  volumePath = "/home/${userName}/services/${serviceName}";
in
{
  project.name = serviceName;
  services.${serviceName} = {
    service = {
      image = "ckulka/baikal:nginx";
      restart = "unless-stopped";
      volumes = [
        "${volumePath}/config:/var/www/baikal/config"
        "${volumePath}/data:/var/www/baikal/Specific"
      ];
    };
  };
}