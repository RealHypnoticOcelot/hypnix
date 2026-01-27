{
  programs.thunderbird = {
    enable = true;
    settings = {
      "datareporting.healthreport.uploadEnabled" = false; # Disable sending technical and interaction data to Mozilla
      "mail.chat.enabled" = false; # Chat feature
      "mailnews.start_page.enabled" = false; # Whether the Start Page opens upon launch
      "mail.shell.checkDefaultClient" = false; # Check if Thunderbird is default mail client on launch
    };
    profiles = {
      default = {
        isDefault = true;
        search.engines = {
          Startpage = {
            name = "Startpage";
            description = "Startpage Search";
            urls = [
              {
                template = "https://www.startpage.com/sp/search";
                params = {
                  { name = "query"; value = "{searchTerms}"; }
                };
                icon = "https://www.startpage.com/favicon.ico";
                method = "POST";
              }
            ];
          };
        };
        search.force = true; # Force replace the existing search configuration
      };
    };
  };
}