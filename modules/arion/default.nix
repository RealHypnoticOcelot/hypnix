{ config, pkgs, lib, inputs, userName, hostName, ... }:

let
  containerProfiles = (import ./containerprofiles.nix {
    inherit lib inputs userName;
  });
  selectedContainers = [
    "koito"
  ];
in
let
  sopsImports = lib.flatten (
    map (
      profile:
      lib.optionals (
        containerProfiles ? ${profile} && containerProfiles.${profile} ? "sops"
      ) map (
        sopsImport: ( import sopsImport {
          inherit config;
          profileName = profile;
        })
      ) containerProfiles.${profile}.sops
    ) selectedContainers
  );

  projects = builtins.listToAttrs (
    map ( 
      container:
        lib.optionals (
          containerProfiles ? ${container} # If the container exists in containerProfiles
        ) {
          name = container;
          value = builtins.listToAttrs (
          lib.mapAttrsToList (
            projectName:
            value:
            if (projectName != "sops") then
            {
              name = "settings";
              value = {
                imports = map (
                # What we're doing with map here is intercepting each
                # provided path and modifying them so that they inherit things
                  path: ( import path {
                    inherit userName config projectName; # ex. minecraft
                    profileName = container; # ex. minecraft-router
                    volumePath = "/home/${userName}/services/${projectName}";
                  })
                ) containerProfiles.${container}.${projectName};
              };
            }
            else
            { # Return an empty list if the project is sops, because we're handling that specially
              name = "settings";
              value = {
                imports = [];
              };
            }
          ) containerProfiles.${container}
        );
      }
    ) selectedContainers
  );
# Let's walk through the above code, assuming profiles = [ "minecraft-router" "minecraft-vanilla" ],
# and those profiles have the following values in containerprofiles.nix:
#
# minecraft-router = {
#   minecraft = [
#     ./containers/minecraft
#   ];
# };
# minecraft-vanilla = {
#   minecraft = [
#     ./containers/minecraft/vanilla.nix
#   ];
# };
#
# Given minecraft, we'll check if containerProfiles.minecraft exists. It does, so we proceed!
# We want to return an attribute set that can be parsed by builtins.listToAttrs. That means
# we need sets that look like such:
#
# {
#   name = minecraft;
#   value = {
#     settings.imports = [
#       ./containers/minecraft
#     ];
#   };
# }
# Which once evaluated by builtins.listToAttrs, looks more like this:
# minecraft = {
#   settings = {
#     imports = [
#       ./containers/minecraft
#     ];
#   };
# };
#
# The same is done for minecraft-vanilla, except imports = [ ./containers/minecraft/vanilla.nix ].
# Note how we're using the project name here, and not the profile name. In other words,
# instead of minecraft-router.settings.imports, we're setting minecraft.settings.imports.
# That means we can modularly import different services under the same project space.
# We want the minecraft-router service and the minecraft-vanilla service under the
# same project space, which is why they both specify the project as Minecraft!
# It should also be possible to import different things under different projects,
# unless I programmed something wrong. 
# When all said and done, here's what the above function should output as an example:
#
# {
#   minecraft = {
#     settings = {
#       imports = [
#         (import ./containers/minecraft {
#           inherit userName config;
#         })
#       ];
#     };
#   };
#   minecraft = {
#     settings = {
#       imports = [
#         (import ./containers/minecraft/vanilla.nix {
#           inherit userName config;
#         })
#       ];
#     };
#   };
# }
#
# Those attribute sets will merge, and ultimately be equivalent to this:
#
# {
#   minecraft = {
#     settings = {
#       imports = [
#         (import ./containers/minecraft {
#           inherit userName config;
#         })
#         (import ./containers/minecraft/vanilla.nix {
#           inherit userName config;
#         })
#       ];
#     };
#   };
# }
#
# Voila!
# Keep in mind that any projects called "sops" will instead be imported normally!
in
{
  environment.systemPackages = with pkgs; [
    # Do install the docker CLI to talk to podman.
    # Not needed when virtualisation.docker.enable = true;
    docker-client
  ];
  
  imports = sopsImports;
  # Arion works with Docker, but for NixOS-based containers, you need Podman
  # since NixOS 21.05. Probably just use Podman, then!
    virtualisation.arion = {
    backend = "podman-socket";
    projects = projects;
  };
}