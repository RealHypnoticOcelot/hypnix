{ config, profileName, ... }:
let
  secrets = map (
    secret: "${profileName}-${secret}"
  ) [
    "domain"
    "smtp_host" # Mailserver FQDN
    "smtp_from"
    "smtp_username"
    "smtp_password"

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
      DOMAIN = ${config.sops.placeholder."${profileName}-domain"}
      SMTP_HOST = ${config.sops.placeholder."${profileName}-smtp_host"}
      SMTP_FROM = ${config.sops.placeholder."${profileName}-smtp_from"}
      SMTP_USERNAME = ${config.sops.placeholder."${profileName}-smtp_username"}
      SMTP_PASSWORD = ${config.sops.placeholder."${profileName}-smtp_password"}
    '';
  };
}