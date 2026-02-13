{ lib, inputs, userName, hostName, config, ... }:

let
  containerProfiles = (import ./containerprofiles.nix {
    inherit lib inputs userName;
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
          settings.imports = map (
          # What we're doing with map here is modifying each provided path so that they inherit userName
          # Not pretty, but it works!
            path:
              ( import path {
                inherit userName config;
              }) 
          ) containerProfiles.${container};
        };
      }
  ) profiles;
# When all said and done, here's what the above function should output as an example:
# [
#   {
#     terraria = {
#       settings = {
#         imports = [
#           (import ./containers/terraria {
#             inherit userName config;
#           })
#         ];
#       };
#     };
#     minecraft = {
#       settings = {
#         imports = [
#           (import ./containers/minecraft {
#             inherit userName config;
#           })
#           (import ./containers/minecraft-reverse-proxy {
#             inherit userName config;
#           })
#         ];
#       };
#     };
#   }
# ]
# In reality, there's very few scenarios where you'd need to import multiple things at once
# like shown in the minecraft profile, but it's possible just in case!
in
builtins.listToAttrs projects