{ pkgs, ... }:
{
  programs.plasma = {
    enable = true;
    overrideConfig = true; # Whether this is the only source of truth for configuration
    workspace.colorScheme = "BreezeDark";
    powerdevil = {
      battery.dimDisplay.idleTimeout = 900; # In seconds
      battery.turnOffDisplay.idleTimeout = 1800; # In seconds
    };
    configFile = {
      klipperrc.General.MaxClipItems = 2048; # Maximum 2048
      krunnerrc= {
        Plugins = {
          browserhistoryEnabled = false;
          browsertabsEnabled = false;
          krunner_appstreamEnabled = false; # Software Center applications showing up in search
          krunner_webshortcutsEnabled = false; # Search the web
        };
      };
    };
    workspace = {
      enableMiddleClickPaste = false;
    };
    input = {
      touchpads.disableWhileTyping = false;
    };
    panels = [
      { # The taskbar at the bottom of the screen
        floating = false;
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
                  # These are a pain to find! I found them by pinning them manually,
                  # running `nano ~/.config/plasma-org.kde.plasma.desktop-appletsrc`,
                  #. and checking the general applet configuration for 
                  # `org.kde.plasma.icontasks`. Then, you have to change
                  # `file://nix/store/blahblahwhatever/yourapp.desktop` to `applications:yourapp.desktop`.
                  "applications:librewolf.desktop"
                  "applications:org.kde.dolphin.desktop"
                  "applications:steam.desktop"
                  "applications:vesktop.desktop"
                ];
              };
            };
          }
          {
            name = "org.kde.plasma.mediacontroller"; # Shows the track currently playing
          }
          {
            name = "org.kde.plasma.marginsseparator";
          }
          {
            systemTray.items = {
              # Explicitly show
              shown = [
                #
              ];
              # Explicitly hide
              hidden = [
                "org.kde.plasma.battery"
                "org.kde.plasma.networkmanagement"
                "org.kde.plasma.volume"
                "org.kde.plasma.brightness"
                "org.kde.plasma.clipboard"
                "org.kde.merkuro.contact.applet"
              ];
            };
          }
          {
            name = "org.kde.plasma.battery";
            config = {
              General = {
                showPercentage = true;
              };
            };
          }
          {
            name = "org.kde.plasma.networkmanagement";
          }
          {
            name = "org.kde.plasma.volume";
          }
          {
            name = "org.kde.plasma.brightness";
          }
          {
            name = "org.kde.plasma.clipboard";
          }
          {
            digitalClock = {
              calendar.firstDayOfWeek = "sunday";
              time.format = "12h";
              date.format.custom = "ddd M/d";
            };
          }
        ];
      }
    ];
  };
}