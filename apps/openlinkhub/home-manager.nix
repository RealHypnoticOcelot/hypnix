{ pkgs, ... }:

{
  services.openlinkhub = {
    enable = true;
    dashboard = {
      enable = true;
      settings = {
        celsius = false;
        rgbOff = true;
      };
    };
  };
}