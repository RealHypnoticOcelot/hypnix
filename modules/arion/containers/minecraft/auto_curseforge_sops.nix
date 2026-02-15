{ config, profileName, ... }:
let
  secrets = map (
    secret: "${profileName}-${secret}"
  ) [
    "cf-api-key"
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
      CF_API_KEY = ${config.sops.placeholder."${profileName}-cf-api-key"}
    '';
  };
}