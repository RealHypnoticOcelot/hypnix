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
  boot.kernelParams = [
    "microcode.amd_sha_check=off" # Disable microcode checksum verification so that ucodenix can update microcode properly
    "iommu=soft"
    # This is enabled because of "snd_acp_pci 0000:c4:00.5: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0018 address=0x98e75c5ea32c040 flags=0x0030]"
    # showing up in journalctl repeatedly. See https://bbs.archlinux.org/viewtopic.php?id=168467
    # Uses a software implementation of IOMMU(memory management unit) instead of the available hardware implementation.
    # Prevents PCI passthrough for VMs, if that's something you're into!
  ];

  environment.systemPackages = with pkgs; [
    alsa-utils
  ];
  systemd.services.alsaMicrophone = { # Creates systemd service that disables Auto-Mute Mode on the microphone on sound card 1, automatically on boot
    enable = true;
    script = lib.getExe(pkgs.writeShellApplication {
        name = "fix-auto-mute";
        runtimeInputs = with pkgs; [alsa-utils];
        text = ''
          amixer -c 1 set "Auto-Mute Mode" Disabled
        '';
    });
    wantedBy = [ "multi-user.target" ];
  };
}