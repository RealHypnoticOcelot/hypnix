{ userName, config, ... }:
{
  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml; # Secrets encrypted with the public key
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/${userName}/.config/sops/age/keys.txt";
    secrets = {
      git_username = {};
      git_email = {};
    };
  };
  programs.git = {
    settings = {
      user = {
        name = config.sops.secrets.git_username.path;
        email = config.sops.secrets.git_email.path;
      };
    };
  };
}