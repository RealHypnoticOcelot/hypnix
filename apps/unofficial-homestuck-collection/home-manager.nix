{ pkgs, ... }:

{
  home.packages = with pkgs; [
    unofficial-homestuck-collection
  ];
}