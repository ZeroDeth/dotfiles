{ pkgs, lib, config, ... }:

with lib;

let
  cfg = config.modules.terminal-emulator.nushell;

in
{
  options.modules.terminal-emulator.nushell = {
    enable = mkEnableOption "nushell";
  };

  # https://github.com/srid/nixos-config/blob/master/home/nushell.nix
  config = mkIf cfg.enable {
    programs.nushell = {
      enable = true;
      # The config.nu can be anywhere you want if you like to edit your Nushell with Nu
      envFile.source = ./nushell/env.nu;
      configFile.source = ./nushell/config.nu;
      # inherit (config.home) shellAliases; # Our shell aliases are pretty simple
    };

  };
  # carapace.enable = true;
  # carapace.enableNushellIntegration = true;
}
