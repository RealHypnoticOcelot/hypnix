{ pkgs, ... }:

{
  services = {
    printing = {
      enable = true;
      drivers = with pkgs; [
      cups-filters # Includes "filters", which are used to convert data into a printer-receivable format
      cups-browsed # A helper daemon to Avahi that helps with printer discovery
      ];
    };
  };
}