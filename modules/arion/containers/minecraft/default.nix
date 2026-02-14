{ userName, config, projectName, profileName, ... }:
{
  project.name = projectName;
  services.${profileName} = {
    service = {
      container_name = "${profileName}";
      image = "itzg/mc-router";
      restart = "unless-stopped";
      ports = [
        "25565:25565"
      ];
    };
  };
}