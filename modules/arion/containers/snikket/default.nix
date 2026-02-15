{ userName, config, projectName, profileName, volumePath, ... }:
{
  project.name = projectName;
  services.${profileName} = {
    service = {
      container_name = ${profileName};
      image = "snikket/snikket-server:stable";
      restart = "unless-stopped";
      env_file = [
        config.sops.templates."${profileName}".path
      ];
      volumes = [
        "${volumePath}/data:/snikket"
      ];
    };
  };
  services."${profileName}_portal" = {
    service = {
      container_name = "${profileName}_portal";
      image = "snikket/snikket-web-portal:stable";
      restart = "unless-stopped";
      env_file = [
        config.sops.templates."${profileName}".path
      ];
    };
  };
  services."${profileName}_certs" = {
    service = {
      container_name = "${profileName}_certs";
      image = "snikket/snikket-cert-manager:stable";
      restart = "unless-stopped";
      env_file = [
        config.sops.templates."${profileName}".path
      ];
      volumes = [
        "${volumePath}/data:/snikket"
        "${volumePath}/acme_challenges:/var/www/.well-known/acme-challenge"
      ];
    };
  };
  services."${profileName}_proxy" = {
    service = {
      container_name = "${profileName}_proxy";
      image = "snikket/snikket-web-proxy:stable";
      restart = "unless-stopped";
      env_file = [
        config.sops.templates."${profileName}".path
      ];
      volumes = [
        "${volumePath}/data:/snikket"
        "${volumePath}/acme_challenges:/var/www/.well-known/acme-challenge"
      ];
    };
  };
}