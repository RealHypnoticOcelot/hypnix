{ pkgs, config, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    thcrap-steam-proton-wrapper
    libarchive
  ];
  # See https://github.com/nerusuki/thcrap-steam-proton-wrapper/issues/14
}