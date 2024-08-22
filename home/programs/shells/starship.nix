/* Starship configuration from this example:
  $ starship preset bracketed-segments --output ~/.config/starship.toml
  $ starship preset plain-text-symbols --output ~/.config/starship.toml
  $ starship preset pure-preset --output ~/.config/starship.toml
  $ starship preset pastel-powerline --output ~/.config/starship.toml
  $ starship preset tokyo-night --output ~/.config/starship.toml
  $ starship preset jetpack --output ~/.config/starship.toml
*/

{ pkgs, ... }:

let
  settings = pkgs.lib.importTOML ./starship.toml;
in
{
  programs.starship = {
    enable = true;
    enableBashIntegration = false;
    enableZshIntegration = true;
    enableFishIntegration = true;

    settings = settings;
  };

  # xdg.configFile."starship.toml".source = ./starship.toml;
}
