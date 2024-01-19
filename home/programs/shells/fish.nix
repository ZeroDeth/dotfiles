{ config, lib, pkgs, ... }:

let
  inherit (import ./aliases.nix { pkgs = pkgs; }) shellAliases;
in

{

  # echo "$HOME/.nix-profile/bin/fish" | sudo tee -a /etc/shells
  # sudo chsh -s "/run/current-system/sw/bin/fish" "$USER"
  programs.fish = {
    enable = false;
    package = pkgs.fish;
    inherit shellAliases;

    functions = {
     fish_greeting = "";

    shellInit = ''
        direnv hook fish | source
        direnv export fish | source

        # Set syntax highlighting colours; var names defined here:
        # http://fishshell.com/docs/current/index.html#variables-color
        set fish_color_normal normal
        set fish_color_command white
        set fish_color_quote brgreen
        set fish_color_redirection brblue
        set fish_color_end white
        set fish_color_error -o brred
        set fish_color_param brpurple
        set fish_color_comment --italics brblack
        set fish_color_match cyan
        set fish_color_search_match --background=brblack
        set fish_color_operator cyan
        set fish_color_escape white
        set fish_color_autosuggestion brblack
  '';

    interactiveShellInit = lib.strings.concatStrings (lib.strings.intersperse "\n" [
    #   "source ${sources.theme-bobthefish}/functions/fish_prompt.fish"
    #   "source ${sources.theme-bobthefish}/functions/fish_right_prompt.fish"
    #   "source ${sources.theme-bobthefish}/functions/fish_title.fish"
        (builtins.readFile ./config.fish)
        "set -g SHELL ${pkgs.fish}/bin/fish"

        # 1Password
        # "set -gx SSH_AUTH_SOCK ~/.1password/agent.sock"

        # Activate the iTerm 2 shell integration
        # "iterm2_shell_integration"
    ]);

    shellAliases = {
      ga = "git add";
      gc = "git commit";
      gco = "git checkout";
      gcp = "git cherry-pick";
      gdiff = "git diff";
      gl = "git prettylog";
      gcount = "git shortlog -sn";
      glg = "git log --stat";
      gwch = "git whatchanged -p --abbrev-commit --pretty=medium";
      gp = "git push";
      gs = "git status";
      gt = "git tag";
      gfa = "git fetch --all";
      gpa = "git pull --all";

      bnix = "nix-shell --run bash";
      znix = "nix-shell --run zsh";
      fnix = "nix-shell --run fish";

      # oplogin = "op signin --account my.1password.com sherif@abdalla.uk";

    #   ls = "exa";
    #   ll = "exa -l";
    #   la = "exa --long --all --group --header --group-directories-first --sort=type --icons";
    #   lla = "exa -la";
      # lg = "exa --long --all --group --header --git";
    #   lt = "exa --long --all --group --header --tree --level ";

      rm = "trash-put";
      unrm = "trash-restore";
      rmcl = "trash-empty";
      rml = "trash-list";

      # ossw = "sudo nixos-rebuild switch --flake '/etc/nixos/#nixtst' --impure -v";
      # hmsw = "home-manager switch --flake ~/.config/nixpkgs/#$USER";
      # upa = "nix flake update ~/.config/nixpkgs -v && sudo nix flake update '/etc/nixos/' -v";
      # fusw = "upa && ossw && hmsw";
      # rusw = "ossw && hmsw";
      ucl = "nix-collect-garbage -d && nix-store --gc && nix-store --repair --verify --check-contents && nix-store --optimise -vvv";
      scl = "sudo nix-collect-garbage -d && sudo nix-store --gc && sudo nix-store --repair --verify --check-contents && sudo nix-store --optimise -vvv";
      acl = "ucl && scl";

    };

    # Abbreviate commonly used functions
    # An abbreviation will expand after <space> or <Enter> is hit
    shellAbbrs = {
        # oplogin = "op signin my.1password.com sherif@abdalla.uk";

        # Administer like a sir
        please = "sudo";

        # Personal/Work spacess
        ws = "cd ~/workspace";
        wsp = "cd ~/workspace/personal";
        wsb = "cd ~/workspace/business";
        nixos-config = "cd ~/workspace/nixos-config";
    };

    plugins = [
        # {
        #     name = "iterm2-shell-integration";
        #     src = ./iterm2_shell_integration.fish;
        # }
        {
            name = "fish-fzf";
            src = pkgs.fetchFromGitHub {
            owner = "jethrokuan";
            repo = "fzf";
            rev = "479fa67d7439b23095e01b64987ae79a91a4e283";
            sha256 = "0k6l21j192hrhy95092dm8029p52aakvzis7jiw48wnbckyidi6v";
            };
        }
        # {
        #     name = "fzf";
        #     src = pkgs.fetchFromGitHub {
        #     owner = "PatrickF1";
        #     repo = "fzf.fish";
        #     rev = "6d8e962f3ed84e42583cec1ec4861d4f0e6c4eb3";
        #     sha256 = "sha256-0rnd8oJzLw8x/U7OLqoOMQpK81gRc7DTxZRSHxN9YlM";
        #     };
        # }
        # Need this when using Fish as a default macOS shell in order to pick
        # up ~/.nix-profile/bin
        # {
        #     name = "nix-env";
        #     src = pkgs.fetchFromGitHub {
        #     owner = "lilyball";
        #     repo = "nix-env.fish";
        #     rev = "00c6cc762427efe08ac0bd0d1b1d12048d3ca727";
        #     sha256 = "1hrl22dd0aaszdanhvddvqz3aq40jp9zi2zn0v1hjnf7fx4bgpma";
        #     };
        # }
        {
            name = "fish-abbreviation-tips";
            src = pkgs.fetchFromGitHub {
            owner = "gazorby";
            repo = "fish-abbreviation-tips";
            rev = "8ed76a62bb044ba4ad8e3e6832640178880df485";
            sha256 = "05b5qp7yly7mwsqykjlb79gl24bs6mbqzaj5b3xfn3v2b7apqnqp";
            };
        }
     ];
   };
  };
}
