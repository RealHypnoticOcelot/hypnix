{ userName, config, projectName, profileName, volumePath, ... }:
{
  project.name = projectName;
  services.${profileName} = {
    service = {
      container_name = "${profileName}";
      image = "ghcr.io/bluesky-social/pds:latest";
      restart = "unless-stopped";
      environment = {
        PDS_DATA_DIRECTORY= "/pds";
        PDS_BLOBSTORE_DISK_LOCATION = "/pds/blocks";
        PDS_DID_PLC_URL = "https://plc.directory";
        PDS_BSKY_APP_VIEW_URL = "https://api.bsky.app";
        PDS_BSKY_APP_VIEW_DID= "did:web:api.bsky.app";
        PDS_REPORT_SERVICE_URL= "https://mod.bsky.app";
        PDS_REPORT_SERVICE_DID = "did:plc:ar7c4by46qjdydhdevvrndac";
        PDS_CRAWLERS = "https://bsky.network";
        LOG_ENABLED = "true";
      };
      env_file = [
        config.sops.templates.${profileName}.path
      ];
      volumes = [
        "${volumePath}/pds:/pds"
      ];
    };
  };
}