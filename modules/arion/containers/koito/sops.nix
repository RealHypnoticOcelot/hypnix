{ config, profileName, ... }:
let
  mkSecrets = (import ../../mksecrets.nix {
    inherit config profileName;
  });
in
mkSecrets [
  "allowed_hosts"
  "db_password"
]