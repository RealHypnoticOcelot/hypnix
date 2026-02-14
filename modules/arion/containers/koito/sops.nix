{
  sops = {
    secrets = {
      koito-db_password = {};
      koito-allowed_hosts = {};
    };
    templates = builtins.mapAttrs (
      name:
      value: config.sops.placeholder.${name}
    ) secrets;
  };
}