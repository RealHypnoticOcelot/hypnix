{ userName, config, projectName, profileName, volumePath, ... }:
{
  project.name = projectName;
  services.${profileName} = {
    service = {
      image = "itzg/minecraft-server";
      restart = "unless-stopped";
      environment = {
        EULA = "true";
        TYPE = "AUTO_CURSEFORGE";
        MIN_MEMORY = "4G";
        MAX_MEMORY = "8G";
        MOTD = "Welcome to the server!";
        MAX_PLAYERS = "20";
        ENABLE_COMMAND_BLOCK = "true";
        ALLOW_FLIGHT = "true";
        SPAWN_PROTECTION = "0";
        CF_API_KEY = config.sops.secrets.cf-api-key;
        CF_SLUG = "all-the-mods-10";
      };
      # ports = [
      #   "19132:19132/udp" # Only needed if using Geyser/Floodgate
      # ];
      volumes = [
        "${volumePath}/${profileName}:/data"
        "${volumePath}/downloads:/downloads"
      ];
      depends_on = [
        "${projectName}-router"
      ];
      labels = {
        "mc-router.host" = "curseforge.example.com";
      };
    };
  };
}