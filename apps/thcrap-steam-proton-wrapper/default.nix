{ pkgs, config, lib, ... }:

{
  # This is a system module so that we can do things like open ports for things like remote play.
  programs.steam = {
    extraCompatPackages = with pkgs; [
      thcrap-steam-proton-wrapper
    ];
  };
}