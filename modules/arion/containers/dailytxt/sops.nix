{ config, profileName, ... }:
let
  mkSecrets = (import ../../mksecrets.nix {
    inherit config profileName;
  });
in
mkSecrets [
  "secret_token"
  "admin_password"
]