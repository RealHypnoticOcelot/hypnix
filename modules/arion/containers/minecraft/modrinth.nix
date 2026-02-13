{ userName, config, ... }:
let 
  serviceName = "minecraft";
  volumePath = "/home/${userName}/services/${serviceName}";
in
{
  project.name = serviceName;
  services."${serviceName}-modrinth" = {
    service = {
      image = "itzg/minecraft-server";
      restart = "unless-stopped";
      environment = {
        EULA = "true";
        TYPE = "MODRINTH";
        MIN_MEMORY = "4G";
        MAX_MEMORY = "8G";
        MOTD = "Welcome to the server!";
        MAX_PLAYERS = "20";
        ENABLE_COMMAND_BLOCK = "true";
        ALLOW_FLIGHT = "true";
        SPAWN_PROTECTION = "0";
        MODRINTH_MODPACK = "g9O0WaGR"; # Modpack ID
      };
      # ports = [
      #   "19132:19132/udp" # Only needed if using Geyser/Floodgate
      # ];
      volumes = [
        "${volumePath}/modrinth:/data"
        "${volumePath}/downloads:/downloads"
      ];
      depends_on = [
        "${serviceName}_router"
      ];
      labels = {
        "mc-router.host" = "modrinth.example.com";
      };
    };
  };
}