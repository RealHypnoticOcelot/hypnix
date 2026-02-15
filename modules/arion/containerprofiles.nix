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
    sops = [
      ./containers/bookstack/sops.nix
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
    sops = [
      ./containers/minecraft/auto_curseforge_sops.nix
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
    sops = [
      ./containers/dailytxt/sops.nix
    ];
  };
  docker-mailserver = {
    docker-mailserver = [
      ./containers/docker-mailserver
    ];
    sops = [
      ./containers/docker-mailserver/sops.nix
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