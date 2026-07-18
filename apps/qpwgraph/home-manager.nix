{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    qpwgraph
  ];
}