{ config, profileName, ... }:
let
  mkSecrets = (import ../../mksecrets.nix {
    inherit config profileName;
  });
in
mkSecrets [
  "app_url"
  "db_password"
]