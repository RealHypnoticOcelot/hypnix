{ pkgs, ... }:
# This module adds support for some compression formats that aren't
# included with the Ark application.
{
  home.packages = with pkgs; [
    unrar-free # For .rar
    p7zip # For .7z
  ];
}