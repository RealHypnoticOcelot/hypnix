{ config, ... }:
import <nixpkgs> { system = config.nixpkgs.hostPlatform; }