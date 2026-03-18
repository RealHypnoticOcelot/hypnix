{ pkgs, ... }:
{
  home.packages = with pkgs; [
    libreoffice-qt # qt is the LTS/still version, qt-fresh is the bleeding-edge version
    hunspell
    hunspellDicts.en_US # Spellcheck for en_US locale 
    hyphenDicts.en_US # Hyphenation dictonaries for en_US locale
  ];
}