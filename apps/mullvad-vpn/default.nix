{ pkgs, ... }:
{
  services.mullvad-vpn = {
    enable = true;
    gui.enable = true;
    enableEarlyBootBlocking = true;
    # enableEarlyBootBlocking is recommended in situations where Mullvad is the only service affecting network configurations, see
    # https://github.com/NixOS/nixpkgs/blob/nixos-unstable/nixos/modules/services/networking/mullvad-vpn.nix#L31
  };
}