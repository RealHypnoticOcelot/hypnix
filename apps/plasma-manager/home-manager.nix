{ pkgs, ... }:
{
  programs.plasma = {
    enable = true;
    panels = { # The taskbar at the bottom of the screen
      floating = "false";
      widgets = [ # The items on the taskbar
        {
          name = "org.kde.plasma.kickoff";
          config = {
            General = {
              icon = "nix-snowflake-white";
              alphaSort = true;
            };
          };
        }
        {
          name = "org.kde.plasma.icontasks"; # The icons for applications that you pin
          config = {
            General = {
              launchers = [
                "applications:org.kde.dolphin.desktop"
                "applications:org.kde.konsole.desktop"
              ]
            }
          };
        }
        
      ]
    };
  };
}