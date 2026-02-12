{ lib, inputs, userName, hostName, ... }:

let
  containerProfiles = (import ./containerprofiles.nix {
    inherit lib inputs;
  });
in
{ # The arguments that mkHost supports go below this line
  profiles ? [ ]
}:
let
{
  projects = lib.flatten (
    map (
      container:
      lib.optionals (
        containerProfiles ? ${container}
      ) containerProfiles.${container}
    ) profiles # The function isn't mapping TO profiles, it's mapping FROM profiles
  );
}