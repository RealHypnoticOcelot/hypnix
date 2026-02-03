{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    cloudflare-warp
  ];
}