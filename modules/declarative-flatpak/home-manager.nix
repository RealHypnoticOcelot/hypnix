{ userName, ... }:

{
  services.flatpak = {
    enable = true;
  };
  xdg = {
    enable = true;
    systemDirs.data = [
      "~/.local/share/flatpak/exports/share"
    ];
  };
}