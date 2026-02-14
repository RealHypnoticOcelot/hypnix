{ config, ... }:
let
  secrets = [
    "koito-db_password"
    "koito-allowed_hosts"
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
    templates = builtins.listToAttrs (
      map (
        secret: {
          name = secret;
          value = {
            content = config.sops.placeholder.${secret};
          };
        }
      ) secrets
    );
  };
}