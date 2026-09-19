{ pkgs, ... }:
{
  home.packages = with pkgs; [
    mcpelauncher-ui-qt
  ];
}