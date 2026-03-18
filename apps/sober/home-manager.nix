{ lib, config, ... }:

#TODO: Create warning if declarative-flatpak isn't enabled
{
  services.flatpak = {
    remotes = {
      "flathub" = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    };
    packages = [
      "flathub:app/org.vinegarhq.Sober//stable" # Sober, Roblox client
    ];
  };
}