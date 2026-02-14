{ userName, config, projectName, profileName, volumePath, ... }:
{
  project.name = projectName;
  services.profileName = {
    service = {
      image = "ryshe/terraria:vanilla-latest";
      restart = "unless-stopped";
      tty = true;
      environment = {
        WORLD_FILENAME = "World.wld";
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