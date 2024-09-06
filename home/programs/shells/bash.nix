{ config, lib, pkgs, ... }:

let
  inherit (import ./aliases.nix { pkgs = pkgs; }) shellAliases;
in

{

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellOptions = [ ];
    historyControl = [ "ignoredups" "ignorespace" ];
    inherit shellAliases;

    # initExtra = builtins.readFile ./bashrc;
    # on macOS, you probably don't need this
    initExtra = ''
      # Make Nix and home-manager installed things available in PATH.
      export PATH=/run/current-system/sw/bin/:/nix/var/nix/profiles/default/bin:$HOME/.nix-profile/bin:/etc/profiles/per-user/$USER/bin:$PATH
    '';

    bashrcExtra = ''
      export GPG_TTY="$(tty)"
      export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

      # Aliases
      [ -f ~/.config/aliases/kubectl_aliases ] && source ~/.config/aliases/kubectl_aliases

      # 1Password
      [ -f ~/.config/op/plugins.sh ] && source ~/.config/op/plugins.sh

      # gcloud components
      # source "$(brew --prefix)/share/google-cloud-sdk/path.bash.inc"

      # Activate flox environment
      eval "$(flox activate --dir ~)"

      # For bash subshells, add to ~/.bashrc or ~/.bash_profile.
      printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "bash"}}\x9c'
    '';

  };
}
