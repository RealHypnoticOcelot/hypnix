{ pkgs, ... }:

{
  programs.vscodium = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      svelte.svelte-vscode
      platformio.platformio-vscode-ide
    ];
  };
  home.packages = with pkgs; [
    nixd
  ];
}