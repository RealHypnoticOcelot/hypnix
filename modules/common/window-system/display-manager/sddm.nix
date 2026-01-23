{
  services.xserver.enable = true; # X server!
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true; # Enable Wayland support
  };
}