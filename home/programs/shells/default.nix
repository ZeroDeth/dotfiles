{ pkgs, ... }: {

  imports = [
    ./zsh.nix
    ./fish.nix
    ./git.nix
    ./starship.nix
    ./terminal.nix
  ];

  # must `git add .` or new files won't be found
  home.file = {
    ".config/aliases/kubectl_aliases" = {
      source = ./kubectl_aliases;
      recursive = true;
    };
    # ".ssh/config" = {
    #     source = ./ssh_config;
    # };
    ".tmux.conf" = {
      text = ''
        set-window-option -g mode-keys vi
        set -g default-terminal "screen-256color"
        set -ga terminal-overrides ',screen-256color:Tc'
      '';
    };
    ".tool-versions" = {
      text = ''
        golang 1.22.5
        terraform 1.4.7
        terraform 1.5.7
      '';
    };
  };
}
