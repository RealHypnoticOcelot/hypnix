{ userName, config, projectName, profileName, volumePath, ... }:
{
  project.name = projectName;
  services.${profileName} = {
    service = {
      image = "ghcr.io/docker-mailserver/docker-mailserver:latest";
      # Provide the FQDN of your mail server here (Your DNS MX record should point to this value)
      hostname = config.sops.templates."${projectName}-hostname".path;
      restart = "unless-stopped";
      volumes = [
        "${volumePath}/docker-data/dms/mail-data/:/var/mail"
        "${volumePath}/docker-data/dms/mail-state/:/var/mail-state"
        "${volumePath}/docker-data/dms/mail-logs/:/var/log/mail"
        "${volumePath}/docker-data/dms/config/:/tmp/docker-mailserver/"
        "/etc/localtime:/etc/localtime:ro"
      ];
      env_file = [
        "${volumePath}/mailserver.env"
      ];
      ports = [
        "25:25"    # SMTP  (explicit TLS => STARTTLS, Authentication is DISABLED => use port 465/587 instead)
        "143:143"  # IMAP4 (explicit TLS => STARTTLS)
        "465:465"  # ESMTP (implicit TLS)
        "587:587"  # ESMTP (explicit TLS => STARTTLS)
        "993:993"  # IMAP4 (implicit TLS)
      ];
      stop_grace_period = "1m";
      healthcheck = {
        test = [
          "ss --listening --tcp | grep -P 'LISTEN.+:smtp' || exit 1"
        ];
        timeout = "3s";
        retries = 0;
      };
    };
  };
}