{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans # Chinese, Japanese, and Korean fonts
      noto-fonts-color-emoji
      liberation_ttf
    ];
  };
}