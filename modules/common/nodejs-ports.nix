# Ideally, you'd be able to specify open ports inside a Nix development shell, but you can't, so system config it is!
{
  networking.firewall.allowedTCPPorts = [
    5173 # For Vite
  ];
}