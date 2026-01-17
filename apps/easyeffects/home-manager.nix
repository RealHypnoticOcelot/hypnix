{ pkgs, userName, lib, config, ... }:

{
  programs.easyeffects = {
    enable = true;
  };
  programs.dconf.enable = true; # Necessary for the daemon to work properly
}