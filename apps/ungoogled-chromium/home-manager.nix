{ pkgs, ... }:

{
  programs.chromium = {
    enable = true;
    package = with pkgs; [
      ungoogled-chromium
    ];
  };
}