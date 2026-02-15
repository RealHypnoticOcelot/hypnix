{ config, profileName, ... }:
let
  secrets = map (
    secret: "${profileName}-${secret}"
  ) [
    "domain"
    "admin_email"
  ];
in
{
  sops = {
    secrets = builtins.listToAttrs (
      map (
        secret: {
          name = secret;
          value = {};
        }
      ) secrets
    );
    templates.${profileName}.content = ''
      SNIKKET_DOMAIN = ${config.sops.placeholder."${profileName}-domain"}
      SNIKKET_ADMIN_EMAIL = ${config.sops.placeholder."${profileName}-admin_email"}
      SNIKKET_TWEAK_HTTP_PORT = 5080
      SNIKKET_TWEAK_HTTPS_PORT = 5443
    ''; # Changing the ports to allow for some reverse proxying fun!
  };
}