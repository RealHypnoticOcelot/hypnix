{ userName, config, ... }:
let 
  serviceName = "terraria";
  volumePath = "/home/${userName}/services/${serviceName}";
in
{
  project.name = serviceName;
  services.${serviceName} = {
    service = {
      image = "ryshe/terraria:vanilla-latest";
      restart = "unless-stopped";
      tty = true;
      environment = {
        WORLD_FILENAME = "test.wld";
      };
      volumes = [
        "${volumePath}:/root/.local/share/Terraria/Worlds"
      ];
      ports = [
        "7777:7777"
      ];
    };
  };
}