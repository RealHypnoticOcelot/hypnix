{ stateVersion, ... }:
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home = {
    inherit stateVersion;
  };
}