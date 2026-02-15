{ config, profileName, ... }:
let
  secrets = map (
    secret: "${profileName}-${secret}"
  ) [
    "hostname"
    "jwt_secret" # openssl rand --hex 16
    "admin_password" # openssl rand --hex 16
    "plc_rotation_key_k256_private_key_hex" # openssl ecparam --name secp256k1 --genkey --noout --outform DER | tail --bytes=+8 | head --bytes=32 | xxd --plain --cols 32
    "email_smtp_url" # smtp://your@address.com:yourPasswordHere@your.mailserver.here:587/
    "email_from_address"
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
      PDS_HOSTNAME = ${config.sops.placeholder."${profileName}-hostname"}
      PDS_JWT_SECRET = ${config.sops.placeholder."${profileName}-jwt_secret"}
      PDS_ADMIN_PASSWORD = ${config.sops.placeholder."${profileName}-admin_password"}
      PDS_PLC_ROTATION_KEY_K256_PRIVATE_KEY_HEX = ${config.sops.placeholder."${profileName}-plc_rotation_key_k256_private_key_hex"}
      PDS_EMAIL_SMTP_URL = ${config.sops.placeholder."${profileName}-email_smtp_url"}
      PDS_EMAIL_FROM_ADDRESS = ${config.sops.placeholder."${profileName}-email_from_address"}
    '';
  };
}