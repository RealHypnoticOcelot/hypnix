{ userName, config, projectName, profileName, volumePath, ... }:
# projectName: minecraft
# profileName: minecraft-vanilla
{
  project.name = projectName;
  services.${profileName} = {
    service = {
      container_name = "${profileName}";
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
        "${volumePath}/${profileName}:/data"
      ];
      depends_on = [
        "${projectName}-router"
      ];
      labels = {
        "mc-router.host" = "vanilla.example.com";
      };
    };
  };
}