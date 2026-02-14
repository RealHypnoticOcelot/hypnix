{ config, profileName, ... }:
let
  secrets = map (
    secret: "${profileName}-${secret}"
  ) [
    "allowed_hosts"
    "db_password"
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
      KOITO_ALLOWED_HOSTS = ${config.sops.placeholder."${profileName}-allowed_hosts"}
      KOITO_DATABASE_URL = postgres://postgres:${config.sops.placeholder."${profileName}-db_password"}@${profileName}_db:5432/koitodb
    '';
    templates."${profileName}_db".content = ''
      POSTGRES_PASSWORD = ${config.sops.placeholder."${profileName}-db_password"}
    '';
  };
}