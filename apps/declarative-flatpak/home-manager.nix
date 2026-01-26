{ userName, ... }:

{
  services.flatpak = {
    enable = true;
    update.onActivation = true; # Automatically update
    remotes = {
      "flathub" = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    };
    packages = [
      "org.vinegarhq.Sober"
    ];
  };
}