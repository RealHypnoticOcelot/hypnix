{ pkgs, ... }:

{
  pkgs.config.allowUnfreePredicate = (cloudflare-warp: true);
  home.packages = with pkgs; [
    cloudflare-warp
  ];
}