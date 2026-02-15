{ config, profileName, ... }:
let
  secrets = map (
    secret: "${profileName}-${secret}"
  ) [
    "admin_password"
    "server_name"
    "server_password"
    "rcon_password"
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
      ADMIN_PASSWORD = ${config.sops.placeholder."${profileName}-admin_password"}
      SERVER_NAME = ${config.sops.placeholder."${profileName}-server_name"}
      SERVER_PASSWORD = ${config.sops.placeholder."${profileName}-server_password"}
      RCON_PASSWORD = ${config.sops.placeholder."${profileName}-rcon_password"}
    '';
  };
}