{ userName, config, projectName, profileName, volumePath, systemDisk, ... }:
{
  project.name = projectName;
  services.${profileName} = {
    service = {
      container_name = "${profileName}";
      image = "ghcr.io/analogj/scrutiny:master-omnibus";
      restart = "unless-stopped";
      capabilities = {
        SYS_RAWIO = "true";
        SYS_ADMIN = "true";
      };
      volumes = [
        "/run/udev:/run/udev:ro"
        "${volumePath}/config:/opt/scrutiny/config"
        "${volumePath}/influxdb:/opt/scrutiny/influxdb"
      ];
      devices = {
        ${systemDisk}
      };
    };
  };
}