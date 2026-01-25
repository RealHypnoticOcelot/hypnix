{
  services.flatpak = {
    enable = true;
    remotes = {
      "flathub" = "https://flathub.org/repo/flathub.flatpakrepo";
    };
    packages = [
      {
        appid = "org.vinegarhq.Sober";
        origin = "flathub";
      }
    ];
  };
}