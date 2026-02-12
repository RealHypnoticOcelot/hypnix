{ ... }:
{
  services.terraria = {
    service = {
      image = "ryshe/terraria:vanilla-latest";
      restart = "unless-stopped";
      tty = true;
      environment = {
        WORLD_FILENAME = "test.wld";
      };
      volumes = [
        "./data:/root/.local/share/Terraria/Worlds"
      ];
      ports = [
        "7777:7777"
      ];
    };
  };
}