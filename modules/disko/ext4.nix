{ hostName, config, lib, systemDisk, ... }:

{
  config = {
    boot.supportedFilesystems = [ "ext4" ];
    disko.devices = {
      disk = {
        main = {
          type = "disk";
          device = systemDisk;
          content = {
            type = "gpt";
            partitions = {
              ESP = { # ESP Partition, for UEFI bootloaders
                priority = 1;
                name = "ESP";
                start = "1M";
                end = "512M"; # A little overkill, but good to be safe!
                type = "EF00";
                content = {
                  type = "filesystem";
                  format = "vfat";
                  mountpoint = "/boot";
                  mountOptions = [ "umask=0077" ];
                };
              };
              root = { # The ext4 partition
                size = "100%";
                content = {
                  type = "filesystem";
                  format = "ext4";
                  mountpoint = "/";
                  settings = {
                    allowDiscards = true;
                    # Allows for TRIM requests, where the operating system can communicate with the disk to determine what sectors can be discarded
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}