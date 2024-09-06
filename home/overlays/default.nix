# https://github.com/mitchellh/nixos-config/blob/main/overlays/default.nix

/* This contains various packages we want to overlay. Note that the
 * other ".nix" files in this directory are automatically loaded.
 */

final: prev: {
  # terminaltexteffects = final.callPackage ./terminaltexteffects.nix { };
  ksctl = final.callPackage ./ksctl.nix { };
}
