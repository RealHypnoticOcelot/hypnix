{ ... }:
{
  virtualisation.arion = {
    backend =
      if (config.virtualisation.podman.enable && config.virtualisation.podman.dockerSocket.enable)
      then "podman-socket"
      else "docker";
  };
}