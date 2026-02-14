{ config, profileName, ... }:
let
  secrets = map (
    secret: "${profileName}-${secret}"
  ) [
    "secret_token"
    "admin_password"
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
    # Can create secret token with openssl rand -base64 32
    templates.${profileName}.content = ''
      SECRET_TOKEN = ${config.sops.placeholder."${profileName}-secret_token"}
      ADMIN_PASSWORD = ${config.sops.placeholder."${profileName}-admin_password"}
    '';
  };
}