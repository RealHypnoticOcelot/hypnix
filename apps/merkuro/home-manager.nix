{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kdePackages.merkuro
    kdePackages.kcontacts
    kdePackages.akonadi-contacts
  ];
  # programs.kde-pim = {
  #   enable = true;
  #   merkuro = true;
  # };
}