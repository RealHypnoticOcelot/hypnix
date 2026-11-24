{ pkgs, ... }:

{
  services.openlinkhub = {
    enable = true;
    dashboard = {
      enable = true;
    };
  };
}