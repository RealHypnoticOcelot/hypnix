{ pkgs, ... }:

{
  home.packages = with pkgs; [
    sherpa-onnx
  ];
}