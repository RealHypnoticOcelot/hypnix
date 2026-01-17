{ lib, inputs, username, hostname, ... }:

{
  moduleProfiles = {
    sops = {
      system = [
        inputs.sops-nix.nixosModules.sops
        ../modules/sops
      ];
      home-manager = [
        inputs.sops-nix.homeManagerModules.sops
        ../modules/sops/home-manager.nix
      ];
    };
    impermanence = {
      # This is handled specially in mkHost{}
    };
    stylix = {
      system = [
        inputs.stylix.nixosModules.stylix
        ../modules/stylix
      ];
      home-manager = [
        inputs.stylix.homeModules.stylix
        ../modules/stylix/home-manager.nix
      ];
    };
    ucodenix = {
      system = [
        inputs.ucodenix.nixosModules.default
        ../modules/ucodenix
      ];
    };
    librewolf = {
      home-manager = [
        ../apps/librewolf/home-manager.nix
      ];
    };
    vesktop = {
      home-manager = [
        ../apps/vesktop/home-manager.nix
      ];
    };
  };
}