{ lib, ... }:

assert assertMsg (services.flatpak.enabled == true) "Enable the declarative-flatpak module first!";
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