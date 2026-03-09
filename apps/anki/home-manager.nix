{
  programs.anki = {
    enable = true; # required for the default Hyprland config
    addons = [
      (with pkgs.ankiAddons; [
        # put Anki Addons Here
      ])
    ]
  };
}