{ userName, config, projectName, profileName, volumePath, ... }:
{
  project.name = projectName;
  services.profileName = {
    service = {
      image = "phitux/dailytxt:latest";
      restart = "unless-stopped";
      volumes = [
        "${volumePath}/data:/data"
      ];
      environment = {
        # Can create secret token with openssl rand -base64 32
        SECRET_TOKEN = config.sops.templates."${projectName}-secret_token".path;
        INDENT = 4;
        ALLOW_REGISTRATION = "false";
        ADMIN_PASSWORD = config.sops.templates."${projectName}-admin_password".path;
        LOGOUT_AFTER_DAYS = 30;
      };
    };
  };
}