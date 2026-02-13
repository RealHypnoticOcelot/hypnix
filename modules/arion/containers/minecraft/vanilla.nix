{ userName, config, ... }:
let 
  serviceName = "minecraft";
  # Not changing it to minecraft-vanilla because I'd rather have it be in the ~/services/minecraft directory
  volumePath = "/home/${userName}/services/${serviceName}";
in
{
  project.name = serviceName;
  services."${serviceName}-vanilla" = {
    service = {
      image = "itzg/minecraft-server";
      restart = "unless-stopped";
      environment = {
        EULA = "true";
        TYPE = "PAPER";
        MIN_MEMORY = "4G";
        MAX_MEMORY = "8G";
        MOTD = "Welcome to the server!";
        MAX_PLAYERS = "20";
        ENABLE_COMMAND_BLOCK = "true";
        ALLOW_FLIGHT = "true";
        SPAWN_PROTECTION = "0";
        USE_AIKAR_FLAGS = "true";
      };
      # ports = [
      #   "19132:19132/udp" # Only needed if using Geyser/Floodgate
      # ];
      volumes = [
        "${volumePath}/vanilla:/data"
      ];
      depends_on = [
        "${serviceName}_router"
      ];
      labels = {
        "mc-router.host" = "vanilla.example.com";
      };
    };
  };
}