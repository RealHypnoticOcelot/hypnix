{
  programs.thunderbird = {
    enable = true;
    # It takes so much to make this application usable!
    settings = {
      "datareporting.healthreport.uploadEnabled" = false; # Disable sending technical and interaction data to Mozilla
      "mail.chat.enabled" = false; # Chat feature
      "mailnews.start_page.enabled" = false; # Whether the Start Page opens upon launch
      "mail.shell.checkDefaultClient" = false; # Check if Thunderbird is default mail client on launch
      "mail.inappnotifications.enabled" = false; # Disable donation message on startup
      "toolkit.legacyUserProfileCustomizations.stylesheets" = true; # Enable userChrome.css and userContent.css
    };
    profiles = {
      default = {
        isDefault = true;
        search = {
          engines = {
            Startpage = {
              name = "Startpage";
              description = "Startpage Search";
              urls = [
                {
                  template = "https://www.startpage.com/sp/search";
                  params = [
                    { name = "query"; value = "{searchTerms}"; }
                    { name = "prfe"; value = "6419af721e37d90b9602249d42ea246ece39b1011e1bea0fcf1d100ebe0a547dd4cfd4f119c410a6d62282183f17e7eba737af8354ab335d03b384f979fc3806c08c462db7525270b8a381b5eeb9"; }
                    # REALLY long, but this contains user preferences! Now, when we search, theme and everything will always be set by default.
                  ];
                }
              ];
              icon = "https://www.startpage.com/favicon.ico";
              method = "POST";
            };
          };
          default = "Startpage";
          force = true; # Force replace the existing search configuration
        };
        userChrome = ''
          #addressBookButton {
            display: none !important;
          }
          #calendarButton {
            display: none !important;
          }
          #tasksButton {
            display: none !important;
          }
        '';
      };
    };
  };
}