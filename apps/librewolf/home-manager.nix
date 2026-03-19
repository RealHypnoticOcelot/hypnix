{ pkgs, userName, lib, config, ... }:

let
  # Policies don't currently allow you to set your private search engine separately from your default search engine.
  # So, we're defining available search engines with the Home Manager option programs.librewolf.profiles.<name>.search.engines
  # Since the available options don't need to change per profile, this implementation is fine. If you wanted to be more
  # elegant, you'd have to change things up a bit!
  searchEngines = {
    kagi = {
      name = "Kagi";
      description = "A privacy-focused, user-centric search engine.";
      urls = [
        {
          template = "https://kagi.com/search";
          params = [
            { name = "q"; value = "{searchTerms}"; }
          ];
          method = "GET";
        }
        {
          template = "https://kagisuggest.com/api/autosuggest";
          params = [
            { name = "q"; value = "{searchTerms}"; }
          ];
          method = "GET";
          type = "application/x-suggestions+json";
        }
      ];
      iconMapObj."32" = "https://kagi.com/favicon-32x32.png";
    };
    startpage = {
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
          method = "GET";
        }
        {
          template = "https://www.startpage.com/osuggestions";
          params = [
            { name = "q"; value = "{searchTerms}"; }
          ];
          method = "GET";
          type = "application/x-suggestions+json";
        }
      ];
      iconMapObj."32" = "https://www.startpage.com/favicon.ico";
    };
    mojeek = {
      name = "Mojeek";
      description = "Search the web using Mojeek";
      urls = [
        {
          template = "https://www.mojeek.com/search";
          params = [
            { name = "q"; value = "{searchTerms}"; }
            { name = "theme"; value = "dark"; }
            { name = "sumb"; value = "0"; } # Toggle 'Summarize these results' button
            { name = "sumt"; value = "0"; } # Toggle summary tab
            { name = "newtab"; value = "1"; } # Open results in a new tab
          ];
          method = "GET";
        }
      ];
      iconMapObj."16" = "https://www.mojeek.com/favicon.png";
    };
    google.metadata.hidden = true;
    bing.metadata.hidden = true;
    duckduckgo.metadata.hidden = true;
    perplexity.metadata.hidden = true;
    wikipedia.metadata.hidden = true;
    libredirect.metadata.hidden = true;
  };
in
{
  programs.librewolf = {
    enable=true;
    policies = {
      # SearchEngines = {
      #   Add = [
      #     {
      #       Name = "Kagi";
      #       Description = "A privacy-focused, user-centric search engine.";
      #       URLTemplate = "https://kagi.com/search?q={searchTerms}";
      #       Method = "GET";
      #       IconURL = "https://kagi.com/favicon-32x32.png";
      #       SuggestURLTemplate = "https://kagisuggest.com/api/autosuggest?q={searchTerms}";
      #     }
      #     {
      #       Name = "Startpage";
      #       Description = "Startpage Search";
      #       URLTemplate = "https://www.startpage.com/sp/search?query={searchTerms}&prfe=6419af721e37d90b9602249d42ea246ece39b1011e1bea0fcf1d100ebe0a547dd4cfd4f119c410a6d62282183f17e7eba737af8354ab335d03b384f979fc3806c08c462db7525270b8a381b5eeb9";
      #       # REALLY long, but this contains user preferences! Now, when we search, theme and everything will always be set by default.
      #       Method = "GET";
      #       IconURL = "https://www.startpage.com/favicon.ico";
      #       SuggestURLTemplate = "https://www.startpage.com/osuggestions?q={searchTerms}";
      #     }
      #     {
      #       Name = "Mojeek";
      #       Description = "Search the web using Mojeek";
      #       URLTemplate = "https://www.mojeek.com/search?q={searchTerms}&theme=dark&sumt=0&sumb=0&newtab=1";
      #       Method = "POST";
      #       IconURL = "https://www.mojeek.com/favicon.png";
      #     }
      #   ];
      #   Remove = [
      #     "Google"
      #     "Bing"
      #     "Perplexity"
      #     "DuckDuckGo"
      #     "Wikipedia (en)"
      #     "LibRedirect"
      #   ];
      #   Default = "Startpage";
      # };
      ExtensionSettings = {
        # You can find extension IDs by going to about:support and going to the extensions section
        "*" = { # Special catch-all for all extensions not included in the policy
          installation_mode = "blocked"; # Prevent other extensions from being installed, they must be defined here
        };
        "uBlock0@raymondhill.net" = { # uBlock Origin
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
          default_area = "menupanel"; # menupanel is under the extensions button, navbar is on the toolbar
        };
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = { # Bitwarden
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
          installation_mode = "force_installed";
          default_area = "navbar";
        };
        "jid0-3GUEt1r69sQNSrca5p8kx9Ezc3U@jetpack" = { # Terms of Service; Didn't Read
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/terms-of-service-didnt-read/latest.xpi";
          installation_mode = "force_installed";
          default_area = "navbar";
        };
        "feed-preview@code.guido-berhoerster.org" = { # Feed Preview
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/feed-preview/latest.xpi";
          installation_mode = "force_installed";
          default_area = "menupanel";
        };
        "{a6c4a591-f1b2-4f03-b3ff-767e5bedf4e7}" = { # User-Agent Switcher and Manager
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/user-agent-string-switcher/latest.xpi";
          installation_mode = "force_installed";
          default_area = "menupanel";
        };
      };
    };
    settings = { # These settings apply to all profiles
      # Librewolf-specific settings
      # "privacy.resistFingerprinting.letterboxing" = true;
      "webgl.disabled" = false;
      "identity.fxaccounts.enabled" = true;
      "privacy.sanitize.sanitizeOnShutdown" = false;
      "privacy.clearOnShutdown.history" = false;
      "privacy.clearOnShutdown.downloads" = false;
      "media.eme.enabled" = true; # Encrypted Media Extensions, or DRM-protected media
      # Firefox settings
      "browser.search.suggest.enabled" = true;
      "browser.theme.content-theme" = 0; # Dark theme!
      "browser.newtabpage.activity-stream.showSponsoredCheckboxes" = false; # "Support LibreWolf" checkbox
      "privacy.userContext.enabled" = false; # Container Tabs
      "browser.urlbar.suggest.engines" = false;
      "browser.urlbar.suggest.quickactions" = false;
      "browser.urlbar.suggest.topsites" = false;
      "browser.search.separatePrivateDefault" = false; # Whether to use a different search engine for private search
      "browser.tabs.loadInBackground" = false; # Set FALSE to switch to newly-opened links, and TRUE to not
      "browser.newtabpage.activity-stream.feeds.topsites" = false; # Add shortcuts to new tab
    };
    profiles = {
      "MainProfile" = {
        id = 0;
        settings = {
          "browser.toolbars.bookmarks.visibility" = "never"; # When to show bookmarks toolbar
        };
        search = {
          engines = searchEngines;
          default = "Startpage";
          privateDefault = "Startpage";
          force = true;
        };
      };
      "School" = {
        id = 1;
        settings = {
          "browser.toolbars.bookmarks.visibility" = "newtab"; # When to show bookmarks toolbar
        };
        search = {
          engines = searchEngines;
          default = "Startpage";
          privateDefault = "Startpage";
          force = true;
        };
      };
    };
  };
}