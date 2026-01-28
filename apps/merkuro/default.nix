{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kdePackages.merkuro
  ];
}