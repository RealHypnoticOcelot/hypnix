{ userName, pkgs, ... }:
{
  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml; # Secrets encrypted with the public key
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/${userName}/.config/sops/age/keys.txt";
    secrets = {
      # Secrets used by system modules go here
      wgcf_privatekey = {};
    };
  };
  environment.systemPackages = with pkgs; [
    sops
    age
  ];
}