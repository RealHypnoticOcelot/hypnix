{ pkgs, ... }:

{
  services.flatpak = {
    remotes = {
      "orion-beta" = "https://flatpak.orionbrowser.com/orion-beta.flatpakrepo";
    };
    packages = [
      "orion-beta:app/com.kagi.Orion//stable"
    ];
  };
}