{ pkgs, ... }:

{
  programs.vscodium = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      svelte.svelte-vscode
      platformio.platformio-vscode-ide
      llvm-vs-code-extensions.vscode-clangd # Required for PlatformIO IDE
    ];
  };
  home.packages = with pkgs; [
    nixd # Recommended for Nix IDE
  ];
}