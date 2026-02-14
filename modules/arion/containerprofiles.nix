{
  terraria = { # Profile name
    terraria = [ # Project name
      ./containers/terraria # Things to import into project under profile
    ];
  };
  bookstack = {
    bookstack = [
      ./containers/bookstack
    ];
  };
  baikal = {
    baikal = [
      ./containers/baikal
    ];
  };
  minecraft-router = {
    minecraft = [
      ./containers/minecraft
    ];
  };
  minecraft-vanilla = { # Profile name
    minecraft = [ # Project name
      ./containers/minecraft/vanilla.nix
    ];
  };
  minecraft-modrinth = {
    minecraft = [
      ./containers/minecraft/modrinth.nix
    ];
  };
  minecraft-auto-curseforge = {
    minecraft = [
      ./containers/minecraft/auto_curseforge.nix
    ];
  };
  bsky-pds = {
    bsky-pds = [
      ./containers/bsky-pds
    ];
  };
  dailytxt = {
    dailytxt = [
      ./containers/dailytxt
    ];
  };
  docker-mailserver = {
    docker-mailserver = [
      ./containers/docker-mailserver
    ];
  };
  roundcube = {
    docker-mailserver = [
      ./containers/docker-mailserver/roundcube.nix
    ];
  };
  freshrss = {
    freshrss = [
      ./containers/freshrss
    ];
  };
  koito = {
    koito = [
      ./containers/koito
    ];
    sops = [
      ./containers/koito/sops.nix
    ];
  };
}