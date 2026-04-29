{ pkgs, ... }:

{
  programs.java = {
    enable = true;
    package = with pkgs; [
      jdk21
    ];
  };
}