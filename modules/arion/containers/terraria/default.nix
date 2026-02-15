{ userName, config, projectName, profileName, volumePath, ... }:
{
  project.name = projectName;
  services.${profileName} = {
    out.service.stdin_open = true; # Normally, we'd have stdin_open defined normally, but it's not added, so this is the workaround.
    service = {
      container_name = "${profileName}";
      image = "ryshe/terraria:vanilla-latest";
      restart = "unless-stopped";
      tty = true;
      environment = {
        WORLD_FILENAME = "World.wld";
        # On first run:
        # Let the container start, run "docker attach terraria",
        # follow the prompts, and set WORLD_FILENAME here to whatever
        # you set your world name to + ".wld".
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