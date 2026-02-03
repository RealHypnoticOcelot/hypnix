{ pkgs, ... }:

{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "cloudflare-warp"
  ];
  home.packages = with pkgs; [
    cloudflare-warp
  ];
}