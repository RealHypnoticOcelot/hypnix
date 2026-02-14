{ config, profileName, ... }:
let
  secrets = map (
    secret: "${profileName}-${secret}"
  ) [
    "app_url"
    "db_password"
    "root_db_password"
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
      APP_URL = ${config.sops.placeholder."${profileName}-app_url"}
      DB_PASSWORD = ${config.sops.placeholder."${profileName}-db_password"}
    '';
    templates."${profileName}_db".content = ''
      MYSQL_ROOT_PASSWORD = ${config.sops.placeholder."${profileName}-root_db_password"}
      MYSQL_PASSWORD = ${config.sops.placeholder."${profileName}-db_password"}
    '';
  };
}