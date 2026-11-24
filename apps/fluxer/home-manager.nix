{ lib, config, ... }:

{
  services.flatpak = {
    remotes = {
      "flathub" = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    };
    packages = [
      "flathub:app/app.fluxer.Fluxer//stable"
    ];
  };
  # home.packages = with pkgs; [
  #   fluxer-bin
  # ];
  # Soon, once it merges into unstable!
}