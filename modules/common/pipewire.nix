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
      jack.enable = true; # JACK Audio Connection Kit; I don't know that I have any applications that use this, but it can't hurt to enable!
    };
  };
}