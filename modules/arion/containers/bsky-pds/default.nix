{ userName, config, ... }:
let 
  serviceName = "bsky-pds";
  volumePath = "/home/${userName}/services/${serviceName}";
in
{
  project.name = serviceName;
  services.${serviceName} = {
    service = {
      image = "ghcr.io/bluesky-social/pds:latest";
      restart = "unless-stopped";
      env_file = [
        "${volumePath}/pds.env"
      ];
      volumes = [
        "${volumePath}/pds:/pds"
      ];
    };
  };
}