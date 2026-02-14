{ userName, config, projectName, profileName, ... }:
{
  project.name = projectName;
  services.${profileName} = {
    service = {
      image = "itzg/mc-router";
      restart = "unless-stopped";
      ports = [
        "25565:25565"
      ];
    };
  };
}