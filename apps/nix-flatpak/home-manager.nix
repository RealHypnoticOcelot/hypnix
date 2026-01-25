{
  services.flatpak = {
    enable = true;
    remotes = {
      "flathub" = "https://flathub.org/repo/flathub.flatpakrepo";
    };
    packages = [
      {
        appId = "org.vinegarhq.Sober";
        origin = "flathub";
      }
    ];
  };
}