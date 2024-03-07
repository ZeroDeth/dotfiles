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
    enableAutosuggestions = true;
    syntaxHighlighting = {
      enable = true;
    };
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
          #source ~/.config/op/plugins.sh

          # Configure ASDF
          . $(brew --prefix asdf)/libexec/asdf.sh

          # Colima and Docker https://stackoverflow.com/a/72560928/6611169
          export DOCKER_HOST="unix://$HOME/.colima/docker.sock"

          # Aliases
          source ~/.config/aliases/kubectl_aliases


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

    # To always Warpify the subshell for this command, add the following command to the end of your .zshrc:
    printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "zsh" }}\x9c'

    '';

    oh-my-zsh = {
      enable = true;
      #   plugins = [
      #     "git"
      #     "common-aliases"
      #  ];
    };

  };
}
