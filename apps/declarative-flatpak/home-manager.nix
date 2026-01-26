{ userName, ... }:

{
  services.flatpak = {
    enable = true;
    remotes = {
      "flathub" = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    };
    packages = [
      "flathub:app/org.vinegarhq.Sober//stable" # Sober, Roblox client
      "flathub:app/org.kde.filelight.desktop//stable" # Filelight, disk usage visualizer
      "flathub:app/org.kde.merkuro.calendar//stable" # Merkuro Calendar, calendar app
    ];
  };
  xdg = {
    enable = true;
    systemDirs.data = [
      "~/.local/share/flatpak/exports/share"
    ];
  };
}