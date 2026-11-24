{ pkgs, userName, ... }:
# Using the udev rules provided by pkgs.openlinkhub, transform them into rules for the home-manager package.
# Roughly like checkOpenLinkHubSetup in https://github.com/nix-community/home-manager/blob/master/modules/services/openlinkhub.nix
let
  originalRules = "${pkgs.openlinkhub}/etc/udev/rules.d/99-openlinkhub.rules";
  openlinkhubRules = pkgs.runCommand "openlinkhub-udev-rules" {} ''
    mkdir -p $out/lib/udev/rules.d
    cp ${originalRules} $out/lib/udev/rules.d/70-openlinkhub.rules
    sed -i '/^KERNEL=="uinput"/d' $out/lib/udev/rules.d/70-openlinkhub.rules
    substituteInPlace $out/lib/udev/rules.d/70-openlinkhub.rules \
      --replace-fail 'OWNER="openlinkhub"' 'OWNER="${userName}"'
  '';
in 
{
  services.udev.packages = [
    openlinkhubRules
  ];
}