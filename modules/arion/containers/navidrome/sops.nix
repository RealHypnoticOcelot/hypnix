{ config, profileName, ... }:
let
  secrets = map (
    secret: "${profileName}-${secret}"
  ) [
    "spotify_id"
    "spotify_secret"
    "listenbrainz_baseurl"
    "lastfm_apikey"
    "lastfm_secret"
  ];
in
{
  sops = {
    secrets = builtins.listToAttrs (
      map (
        secret: {
          name = secret;
          value = {};
        }
      ) secrets
    );
    templates.${profileName}.content = ''
      ND_SPOTIFY_ID = ${config.sops.placeholder."${profileName}-spotify_id"}
      ND_SPOTIFY_SECRET = ${config.sops.placeholder."${profileName}-spotify_secret"}
      ND_LISTENBRAINZ_BASEURL = ${config.sops.placeholder."${profileName}-listenbrainz_baseurl"}
      ND_LASTFM_APIKEY = ${config.sops.placeholder."${profileName}-lastfm_apikey"}
      ND_LASTFM_SECRET = ${config.sops.placeholder."${profileName}-lastfm_secret"}
    '';
  };
}