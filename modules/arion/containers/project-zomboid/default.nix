{ userName, config, projectName, profileName, volumePath, ... }:
{
  project.name = projectName;
  services.${profileName} = {
    service = {
      container_name = "${profileName}";
      image = "docker.io/renegademaster/zomboid-dedicated-server:latest";
      restart = "unless-stopped";
      environment = {
        ADMIN_USERNAME = ${userName};
        AUTOSAVE_INTERVAL = "15";
        DEFAULT_PORT = "16261";
        UDP_PORT= "16262";
        RCON_PORT= "27015";
        GAME_VERSION = "public";
        GC_CONFIG = "ZGC"; # Java GC to use
        MAP_NAMES= "Muldraugh, KY";
        MAX_PLAYERS= "16";
        MAX_RAM= "8192m";
        MOD_NAMES = ""; # Workshop Mod Names (e.g. ClaimNonResidential;MoreDescriptionForTraits)
        MOD_WORKSHOP_IDS = ""; # Workshop Mod IDs (e.g. 2160432461;2685168362)
        PAUSE_ON_EMPTY = "true";
        PUBLIC_SERVER = "true";
        STEAM_VAC = "true";
        USE_STEAM = "true";
        TZ = "UTC";
      };
      env_file = [
        config.sops.templates.${profileName}.path
      ];
      ports = [
        "16261:16261/udp"
        "16262:16262/udp"
        "27015:27015/tcp"
      ];
      volumes = [
        "${volumePath}/data:/home/steam/ZomboidDedicatedServer"
        "${volumePath}/config:/home/steam/Zomboid"
      ];
    };
  };
}