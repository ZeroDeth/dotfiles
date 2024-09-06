{ pkgs, lib, config, ... }:
with lib;
let
  cfg = config.modules.k8s.k9s;
in
{
  options.modules.k8s.k9s = { enable = mkEnableOption "k9s"; };

  #TODO: https://git.bytes.zone/brian/dotfiles.nix/src/branch/main/dotfiles/k9s/default.nix

}
