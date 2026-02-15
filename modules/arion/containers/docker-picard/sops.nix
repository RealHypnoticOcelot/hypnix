{ config, profileName, ... }:
let
  secrets = map (
    secret: "${profileName}-${secret}"
  ) [
    "vnc_password"
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
      VNC_PASSWORD = ${config.sops.placeholder."${profileName}-vnc_password"}
    '';
  };
}