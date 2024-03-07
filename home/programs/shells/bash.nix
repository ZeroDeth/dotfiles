{ config, lib, pkgs, ... }:

let
  inherit (import ./aliases.nix { pkgs = pkgs; }) shellAliases;
in

{

  programs = {
    bash = {
      enable = true;
      enableCompletion = false;
      shellOptions = [ ];
      historyControl = [ "ignoredups" "ignorespace" ];
      inherit shellAliases;

      # initExtra = builtins.readFile ./bashrc;
      # on macOS, you probably don't need this
      initExtra = ''
        # Make Nix and home-manager installed things available in PATH.
        export PATH=/run/current-system/sw/bin/:/nix/var/nix/profiles/default/bin:$HOME/.nix-profile/bin:/etc/profiles/per-user/$USER/bin:$PATH
      '';
    };
    bashrcExtra = ''
      export GPG_TTY="$(tty)"
      export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
      # . ${pkgs.asdf-vm}/share/bash-completion/completions/asdf.bash
      # . ${pkgs.asdf-vm}/share/asdf-vm/asdf.sh

      # Aliases
      source ~/.config/aliases/kubectl_aliases

      # 1Password
      source ~/.config/op/plugins.sh
    '';

  };
}
