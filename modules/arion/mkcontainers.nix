{ lib, inputs, userName, hostName, ... }:

let
  containerProfiles = (import ./containerprofiles.nix {
    inherit lib inputs;
  });
in
profiles:
let
  projects = map (
    container:
      lib.optionals (
        containerProfiles ? ${container}
      ) {
        name = container;
        value = {
          settings.imports = [ 
            containerProfiles.${container}
          ];
        };
      }
  ) profiles;
# [
#   {
#     container = {
#       settings = {
#         imports = {
#           containerProfiles.${container} # is a list
#         }
#       }
#     }
#   }
in
builtins.listToAttrs projects