{
  security = {
    rtkit.enable = true; # Increases Pipewire performance by allowing for use of the realtime scheduler
  };
  services = {
    pipewire = {
      enable = true;
      alsa.enable = true; # Kernel-level sound API
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}