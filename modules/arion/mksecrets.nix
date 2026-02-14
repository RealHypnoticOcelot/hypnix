{ config, profileName, ... }:

providedSecrets:
let
  secrets = map (
    secret: "${profileName}-${secret}"
  ) providedSecrets;
  # Prefixes each secret with profileName-
  # i.e. koito-allowed_hosts, koito-db_password
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