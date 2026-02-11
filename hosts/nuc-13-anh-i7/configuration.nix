{
  config,
  pkgs,
  lib,
  inputs,
  userName,
  hostName,
  stateVersion,
  ...
}:

{
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Configure console keymap
  console.keyMap = "us";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  users.mutableUsers = lib.mkDefault true; # This gets overridden if you use Impermanence
  users.users.${userName} = {
    isNormalUser = true;
    description = userName;
    extraGroups = [
      "wheel" # Allows for use of sudo
      "video" # Allows for access to video devices(and virtual webcams, like OBS)
    ];
  };

  hardware.graphics = {
    enable32Bit = true; # Install 32-bit drivers for applications like Wine
  };

  services.fstrim.enable = true; # Tells SSDs when data is no longer in use, so that it can be erased and marked as free
  zramSwap.enable = false; # Increases RAM availability at the cost of computational power

  services.openssh = {
    ports = [ 376 ]; # Just a random port instead of 22 , to ward off port scanners
    settings = {
      PasswordAuthentication = false;
    };
    authorizedKeys = {
      keys = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCyhT40Q3H+JXOBZd1XaWSO1lqWpoKdJQf7cJ2LIgYQ3yA9hhi80i2s6EyTS+ha8gTZOacSRgEIevPXCz1pH+CPAwR/wYs/PwBD6Il6/c7c8kGm0O2nwtF7qsDh8tApgaRSoccgV6Z4icoVuxBDZQjdOEjnoIv5JvJcHtkLx3wEmHdIq8qL0/5J2+FK27+OUD0pRUcBBQLxL/JvVJPCHGGK8dkKRqLMeQbz+Vx8m9xKl5qMao5mriUQuWtGsS3nUg4HDgzvpjX58mxZPjgaVrxwSjs4pjQaK0+UoZdjdPZr7edhHi0GqhnW5/9qGzomBIINNfvWp+qByF9TWZfprLstP2kppwN4J4wx2Eo+ay4E+bo0Vs5SkXhSjehQRvGrRIPDlYrCsiYF423EvPyb45fb9e6Vdtf1JQYZSjKECSU68KbQXJZV3V7mybXA2N7egqQNsoFnkia0WxBknN4NeJFpah70ZWuZPHsXkVj/Frj521OVst9V9Nn3fVqinVidb8GK4X79HRzG/hOqEteuHTCXO4d7EisXPITr4olKG40atPlPTk1W72WR8SzLo/cOy+1oxPxO/Stcd4xg1iLcuAF7Fnekkq3rZyQK3etTT+3KuR0d7prSOsQKAH4RKLQxdsRjKnp39aTtl5GaxqcDmnE9MkWfAQyC4osYUtp6dVs0pQ== hypnoticocelot@hypnoticocelot-p14s"
      ];
    }
  };

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ]; # Enable flakes!
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = stateVersion; # Did you read the comment?
}