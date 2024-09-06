{ config, lib, pkgs, ... }:

let
  inherit (import ./aliases.nix { pkgs = pkgs; }) shellAliases;
in

{
  programs.zsh = {
    enable = true;
    inherit shellAliases;

    # For macOS's default shell.
    envExtra = ''
      # Make Nix and home-manager installed things available in PATH.
      export PATH=/run/current-system/sw/bin/:/nix/var/nix/profiles/default/bin:$HOME/.nix-profile/bin:/etc/profiles/per-user/$USER/bin:$PATH
    '';

    # profileExtra = ''
    #   [ -r ~/.nix-profile/etc/profile.d/nix.sh ] && source  ~/.nix-profile/etc/profile.d/nix.sh
    #   export XCURSOR_PATH=$XCURSOR_PATH:/usr/share/icons:~/.local/share/icons:~/.icons:~/.nix-profile/share/icons
    # '';

    # shellAliases = config.programs.fish.shellAliases;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    defaultKeymap = "emacs";
    history = {
      size = 10000;
      save = 10000;
      expireDuplicatesFirst = true;
      ignoreDups = true;
      ignoreSpace = true;
    };
    historySubstringSearch.enable = true;

    plugins = [
      {
        name = "fast-syntax-highlighting";
        src = "${pkgs.zsh-fast-syntax-highlighting}/share/zsh/site-functions";
      }
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.5.0";
          sha256 = "0za4aiwwrlawnia4f29msk822rj9bgcygw6a8a6iikiwzjjz0g91";
        };
      }
      {
        name = "fzf-tab";
        src = pkgs.fetchFromGitHub {
          owner = "Aloxaf";
          repo = "fzf-tab";
          rev = "bf3ef5588af6d3bf7cc60f2ad2c1c95bca216241";
          sha256 = "sha256-0/YOL1/G2SWncbLNaclSYUz7VyfWu+OB8TYJYm4NYkM=";
        };
      }
      {
        name = "fzf-forgit";
        src = pkgs.fetchFromGitHub {
          owner = "wfxr";
          repo = "fzf-forgit";
          rev = "b35b309ce57062d301a2036a5fd3c149ad2d62f4";
          sha256 = "sha256-XZeLF0YwUl8N8j8tRRU1QVd8tenTDorZyAHItCE4Jlw=";
        };
      }
    ];

    completionInit =
      ''
        autoload -Uz compinit && compinit
        zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      ''
    ;

    #      envExtra = ''
    #        export PATH=$PATH:/opt/homebrew/bin
    #      '';

    # interactiveShellInit = lib.strings.concatStrings (lib.strings.intersperse "\n" [
    #   (builtins.readFile ./zshrc)
    # ]);

    # dirHashes = {
    #     nixpkgs = "/etc/nix/path/nixpkgs";
    #     home-manager = "/etc/nix/path/home-manager";
    #     share = "/mnt/persist/share";
    #     flake = "/mnt/persist/zerodeth/flake";

    # loginExtra = ''
    #     cd ~/workspace
    # '';

    # initExtraFirst = ''
    # Set PATH, MANPATH, etc., for Homebrew.
    # eval "$(/opt/homebrew/bin/brew shellenv)"
    # '';
    initExtra = ''

        # This is a hack to work around the fact that somehow starting with fish means
        # that my .nix-profile isn't properly loaded, meaning no binaries, nothing
        # fish -C clear

        # Configure PNPM
        # export PNPM_HOME="/Users/zerodeth/Library/pnpm"
        # export PATH="$PNPM_HOME:$PATH"

        # Brew
        eval "$(/opt/homebrew/bin/brew shellenv)"

        # 1Password
        #export SSH_AUTH_SOCK=~/.1password/agent.sock
        #[ -f ~/.config/op/plugins.sh ] && source ~/.config/op/plugins.sh

        # Configure ASDF
        # . $(brew --prefix asdf)/libexec/asdf.sh

        # Colima and Docker https://stackoverflow.com/a/72560928/6611169
        export DOCKER_HOST="unix://$HOME/.colima/docker.sock"

        # Aliases
        [ -f ~/.config/aliases/kubectl_aliases ] && source ~/.config/aliases/kubectl_aliases

        # gcloud components
        source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
        source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

        # krew
        export PATH="''${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

        # This function, `rnix`, is used to run a program within a Nix shell.
        function rnix() {
          local program="''${1}"
          local shell="''${2}"

          if [ -z "''${shell}" ]; then
            shell="zsh"
          fi

          if [ "''${shell}" = "zsh" ]; then
            nix-shell --run zsh -p "''${program}" --run "''${program}"
          else
            nix-shell --run "''${shell}" -p "''${program}" --run "''${program}"
          fi
        }

        # Activate flox environment
        eval "$(flox activate --dir ~)"

        # To always Warpify the subshell
        printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "zsh" }}\x9c'

    '';

    oh-my-zsh = {
      enable = true;
      # plugins = [
      # "git"
      # "common-aliases"
      # ];
    };

  };
}
