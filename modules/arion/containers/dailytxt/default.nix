{ userName, config, ... }:
let 
  serviceName = "dailytxt";
  volumePath = "/home/${userName}/services/${serviceName}";
in
{
  project.name = serviceName;
  services.${serviceName} = {
    service = {
      image = "phitux/dailytxt:latest";
      restart = "unless-stopped";
      volumes = [
        "${volumePath}/data:/data"
      ];
      environment = {
        # Can create secret token with openssl rand -base64 32
        SECRET_TOKEN = config.sops.secrets.dailytxt-secret_token;
        INDENT = 4;
        ALLOW_REGISTRATION = "false";
        ADMIN_PASSWORD = config.sops.secrets.dailytxt-admin_password;
        LOGOUT_AFTER_DAYS = 30;
      };
    };
  };
}