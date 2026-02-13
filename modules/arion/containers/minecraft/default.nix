{ userName, config, ... }:
let 
  serviceName = "minecraft";
  volumePath = "/home/${userName}/services/${serviceName}";
in
{
  project.name = serviceName;
  services."${serviceName}_router" = {
    service = {
      image = "itzg/mc-router";
      restart = "unless-stopped";
      ports = [
        "25565:25565"
      ];
    };
  };
}