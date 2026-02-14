{ config, profileName, ... }:
let
  secrets = map (
    secret: "${profileName}-${secret}"
  ) [
    "hostname"
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
    # Provide the FQDN of your mail server here (Your DNS MX record should point to this value)
    templates.${profileName}.content = ''
      OVERRIDE_HOSTNAME = ${config.sops.placeholder."${profileName}-hostname"}
    '';
    templates."${profileName}_roundcube".content = ''
      ROUNDCUBEMAIL_DEFAULT_HOST = ${config.sops.placeholder."${profileName}-hostname"}
      ROUNDCUBEMAIL_SMTP_SERVER = ${config.sops.placeholder."${profileName}-hostname"}
    '';
  };
}