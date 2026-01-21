{
  moduleProfiles = {
    sops = {
      system = [
        "/etc/ssh" # Where the computer's(not user's) SSH keypairs live, this is necessary to ensure SOPS works as intended
      ];
    };
    networking-networkmanager-iwdbackend = {
      system = [
        "/var/lib/iwd" # "iNet wireless daemon", daemon to improve connection speeds
        "/var/lib/NetworkManager" # Allows for adding and configuring networks
      ];
    };
  };
}