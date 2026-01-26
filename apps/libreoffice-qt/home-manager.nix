{ pkgs, ... }:
{
  home.packages = with pkgs; [
    libreoffice-qt
    hunspell
    hunspellDicts.en_US # Spellcheck for en_US locale 
    hyphenDicts.en_US # Hyphenation dictonaries for en_US locale
  ];
}