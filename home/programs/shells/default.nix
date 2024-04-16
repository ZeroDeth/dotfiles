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
        # pre-commit 2.17.0
        # nodejs 17.9.0
        # flutter 2.10.5-stable
        # sbt 1.5.2
        # python 3.10.4
        # poetry 1.6.1
        # yarn 1.22.19
        # gradle 7.5.1
        # java openjdk-19.0.2
        # maven 3.9.1
        # talosctl 1.3.6
        # clusterctl 1.4.1

        # nodejs lts
        # ruby 3.1.0
        # python 3.10.1
        # direnv 2.32.2
        # golang 1.18.9
        # golang 1.19.12
        # golang 1.20.6
        golang 1.22.2
        # neovim nightly
        terraform 1.4.2
        terraform 1.4.7
        terraform 1.5.7
        # terraform-validator 3.1.3
        # terraform-docs 0.16.0
      '';
    };
  };
}
