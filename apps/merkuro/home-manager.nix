{ pkgs, nixosConfig, ... }:

{
  home.packages = with pkgs; [
    kdePackages.merkuro
  ]
  ++ lib.optionals nixosConfig.services.desktopManager.plasma6.enable [
    # Packages needed for the Contacts widget on Plasma 6 to work properly
    kdePackages.kcontacts
    kdePackages.akonadi-contacts
    # Package for better integration into Plasma(like adding Merkuro calendars to the Digital Clock widget)
    kdePackages.kdepim-addons
  ];
}