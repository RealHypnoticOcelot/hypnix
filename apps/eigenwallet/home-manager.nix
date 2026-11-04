{ pkgs, ... }:

{
  home.packages = with pkgs; [
    eigenwallet
  ];
}