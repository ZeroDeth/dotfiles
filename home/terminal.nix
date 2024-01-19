{ pkgs, misc, lib, config, ... }:

# Platform-independent terminal setup
{
  nixpkgs = {
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages

      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);


      allowBroken = true;

    };
  };

  # Nix packages to install to $HOME
  #
  # Search for packages here: https://search.nixos.org/packages
  home.packages = with pkgs; [
    # Unix tools
    ripgrep # Better `grep`
    fd
    sd
    tree

    # Nix dev
    cachix
    nil # Nix language server
    nix-info
    nixpkgs-fmt
    nixci

    nix-health

    fh

    # Dev
    just
    lazygit # Better git UI
    tmate

     # Me
    gnupg
    pinentry_mac

    helix

    nodejs-18_x
    yarn
    go_1_20
    gopls
    duf

    vscode
    iterm2
    alacritty
    kitty
    byobu
    tmux
    gtop
    # btop
    ctop

    glab

    # vscode
    yq-go
    neofetch
    cheat
    python3
    pre-commit
    chezmoi
    shellcheck
    thefuck
    chatgpt-cli
    tree
    tree-sitter
    topgrade
    trash-cli
    wezterm
    devbox
    prettyping
    colmena
    arkade
    ntfy-sh

    docker
    colima
    lima
    act

    (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];
  fonts.fontconfig.enable = true;

  #---------------------------------------------------------------------
  # Env vars and dotfiles
  #---------------------------------------------------------------------

  home.sessionVariables = {
    LANG = "en_GB.UTF-8";
    LC_CTYPE = "en_GB.UTF-8";
    LC_ALL = "en_GB.UTF-8";
    EDITOR = "nvim";
    PAGER = "less -FirSwX";
    # MANPAGER = "${manpager}/bin/manpager";
    # FLEEK_MANAGED= "1";
    # FLEEK_DEBUG= "1";
    # NIXPKGS_ALLOW_UNFREE= "1";
    # NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM= "1";
    # SSH_AUTH_SOCK = "~/.1password/agent.sock";
    # OP_BIOMETRIC_UNLOCK_ENABLED = "true";
  };

  home.sessionPath = [
      "$HOME/bin"
      "$HOME/.local/bin"
      "$HOME/.gnupg"
      "/opt/homebrew/bin"
      "/opt/homebrew/sbin"
  ];

  # must `git add .` or new files won't be found
  home.file = {
    # ".config/aliases/kubectl_aliases" = {
    #     source = ./aliases/kubectl_aliases;
    #     recursive = true;
    # };
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
        golang 1.20.6
        # neovim nightly
        terraform 1.4.2
        terraform 1.4.7
        terraform 1.5.7
        # terraform-validator 3.1.3
        # terraform-docs 0.16.0
        '';
      };

    # Workaround Required for Gaming, You can run this cmd from terminal; `cachix use nix-community`
    "nix.conf" = {
      target = ".config/nix/nix.conf";
      text = ''
        trusted-users = root zerodeth
        substituters = https://cache.nixos.org https://nix-community.cachix.org https://nix-gaming.cachix.org https://chaotic-nyx.cachix.org https://ezkea.cachix.org
        trusted-public-keys = cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY= cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY= nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs= nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4= nyx.chaotic.cx-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8= chaotic-nyx.cachix.org-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8= ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI=
        '';
     };
  };

  #---------------------------------------------------------------------
  # Programs
  #---------------------------------------------------------------------

  # Programs natively supported by home-manager.
  # https://github.com/nix-community/home-manager/blob/master/modules/modules.nix
  programs = {
    bat.enable = true;
    # Type `z <pat>` to cd to some directory
    zoxide.enable = true;
    # Type `<ctrl> + r` to fuzzy search your shell history
    fzf.enable = true;
    jq.enable = true;
    nix-index.enable = true;
    htop.enable = true;
    atuin.enable = true;
    zsh.oh-my-zsh.enable = true;
    gpg.enable = true;

    # on macOS, you probably don't need this
    bash = {
      enable = true;
      initExtra = ''
        # Make Nix and home-manager installed things available in PATH.
        export PATH=/run/current-system/sw/bin/:/nix/var/nix/profiles/default/bin:$HOME/.nix-profile/bin:/etc/profiles/per-user/$USER/bin:$PATH
      '';
    };

    # For macOS's default shell.
    zsh = {
      enable = true;
      envExtra = ''
        # Make Nix and home-manager installed things available in PATH.
        export PATH=/run/current-system/sw/bin/:/nix/var/nix/profiles/default/bin:$HOME/.nix-profile/bin:/etc/profiles/per-user/$USER/bin:$PATH
      '';

      profileExtra = ''
        [ -r ~/.nix-profile/etc/profile.d/nix.sh ] && source  ~/.nix-profile/etc/profile.d/nix.sh
        export XCURSOR_PATH=$XCURSOR_PATH:/usr/share/icons:~/.local/share/icons:~/.icons:~/.nix-profile/share/icons
      '';

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

          # Warp - For zsh subshells
          printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "zsh"}}\x9c'

      '';
    };

    # https://zero-to-flakes.com/direnv
    direnv = {
      enable = true;
      nix-direnv = {
        enable = true;
      };
      config = {
        global.load_dotenv = true;
        global.strict_env = true;
        global.warn_timeout = "400ms";
      };
    };

    dircolors = {
      enable = true;
      enableBashIntegration = false;
      enableZshIntegration = true;
      enableFishIntegration = true;
      extraConfig = ''
        TERM alacritty
    '';
      settings = {
          ".iso" = "01;31"; # .iso files bold red like .zip and other archives
          ".gpg" = "01;33"; # .gpg files bold yellow
          # Images to non-bold magenta instead of bold magenta like videos
          ".bmp"   = "00;35";
          ".gif"   = "00;35";
          ".jpeg"  = "00;35";
          ".jpg"   = "00;35";
          ".mjpeg" = "00;35";
          ".mjpg"  = "00;35";
          ".mng"   = "00;35";
          ".pbm"   = "00;35";
          ".pcx"   = "00;35";
          ".pgm"   = "00;35";
          ".png"   = "00;35";
          ".ppm"   = "00;35";
          ".svg"   = "00;35";
          ".svgz"  = "00;35";
          ".tga"   = "00;35";
          ".tif"   = "00;35";
          ".tiff"  = "00;35";
          ".webp"  = "00;35";
          ".xbm"   = "00;35";
          ".xpm"   = "00;35";
      };
    };

    gh = {
      enable = true;         #TODO: Moved and working well under homebrew
      gitCredentialHelper = {
        enable = true;
      };
      settings = {
        git_protocol = "ssh";
        # prompt = "enabled";
        # aliases = {
        #   co = "pr checkout";
        #   pv = "pr view";
        # };
      };
    };

    # https://nixos.asia/en/git
    git = {
      enable = true;
      aliases = {
        pushall = "!git remote | xargs -L1 git push --all";
        graph = "log --decorate --oneline --graph";
        add-nowhitespace = "!git diff -U0 -w --no-color | git apply --cached --ignore-whitespace --unidiff-zero -";
        prettylog = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(r) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
      };

      userName = "Sherif Abdalla";
      userEmail = "sherif@abdalla.uk";
      extraConfig = {
          core = {
              # If git uses `ssh` from Nix the macOS-specific configuration in
              # `~/.ssh/config` won't be seen as valid
              # https://github.com/NixOS/nixpkgs/issues/15686#issuecomment-865928923
              # sshCommand = "/usr/bin/ssh";
              askPass = ""; # needs to be empty to use terminal for ask pass
              editor = "code --wait";
          };
          color = {
              ui = true;
          };
          diff = {
            colorMoved = "default";
          };
          merge = {
            conflictstyle = "zdiff3";
          };
          feature.manyFiles = true;
          advice.detachedHead = false;
          init.defaultBranch = "main";
          commit.gpgSign = true;
          push = {
              autoSetupRemote = true;
              default = "tracking";
          };

          # TODO: improve this hack (if possible)
          gpg = lib.mkForce { program = lib.mkForce "${pkgs.gnupg}/bin/gpg2"; };
          tag = {
              forceSignAnnotated = true;
              gpgSign = true;
          };
          branch.autosetuprebase = "always";
          credential = {
              helper = "store"; # want to make this more secure
              credentialStore = "gpg";
          };
          github.user = "zerodeth";
          # Clone git repos with URLs like "gh:zerodeth/dotfiles"
          url."git@github.com:" = {
            insteadOf = "gh:";
            pushInsteadOf = "gh:";
          };
      };

      signing = lib.mkForce {
        # key = "~/.ssh/id_ed25519";
        # signByDefault = builtins.stringLength "~/.ssh/id_ed25519" > 0;
        key = "FDA619F16BBFA377";
        signByDefault = true;
        gpgPath = "${pkgs.gnupg}/bin/gpg2";
      };

        # signing = {
        #     key = "~/.ssh/id_ed25519";
        #     signByDefault = builtins.stringLength "~/.ssh/id_ed25519" > 0;
        # };

      diff-so-fancy.enable = false;

      lfs.enable = true;
      ignores = [ "*~" "*.swp" "*.history" ".DS_Store" "*.terraform/" "*.nix-node" "*.direnv" "result" "*.venv" "*.direnv" "*.idea" ];
    };

    # ssh = {
    #   enable = true;
    #   forwardAgent = false;
      # AddKeysToAgent = true;
      # useKeychain = true;
      # identityFile = "~/.ssh/id_ed25519";
      # identitiesOnly = true;
      # logLevel = "INFO";
      # serverAliveInterval = "60";
      # serverAliveCountMax = "20";
      # Compression = true;
      # AddressFamily = "inet";
      # protocol = "2";
      # preferredAuthentications = "publickey";
      # extraConfig = {
      #   RequestTTY = "no";
      # };

      # extraConfig = builtins.readFile $(self)/config; # TODO: Copied manual to "/nix/store/w64p0vgykzdrimvpnhhwj4h7sagpkqrn-source/home"
      # extraConfig = { source = ./ssh_config; recursive = true; };

      # ProxyCommand = "/usr/local/bin/krssh %h %p";
      # hashKnownHosts = true;
      # controlMaster = "auto";
      # controlPath = "~/.ssh/master-%r@%h:%p";

      # matchBlocks = {
      #   "foo-host" = {
      #     hostname = "host.foo.tld";
      #     user = "root";
      #     port = 22;
      #     identityFile = "~/.ssh/id_ed25519";
      #   };
      #   "bastion-proxy" = {
      #     hostname = "bastion.example.net";
      #     user = "ec2-user";
      #     port = 443;
      #     identityFile = "~/.ssh/id_ed25519";
      #     identitiesOnly = true;
      #     dynamicForwards = [ { port = 8080; } ];
      #     extraOptions = {
      #       RequestTTY = "no";
      #     };
      #   };
      #   work = {
      #     host = (lib.concatStringsSep " " workHosts);
      #     user = workUser;
      #     proxyJump = "bastion-proxy";
      #     certificateFile = "~/.ssh/id_ecdsa-cert.pub";
      #     identitiesOnly = true;
      #   };
      # };
    # };

    # alacritty = {
    #   enable = true;

      # settings = {
      #   env.TERM = "xterm-256color";

      #   key_bindings = [
      #     { key = "K"; mods = "Command"; chars = "ClearHistory"; }
      #     { key = "V"; mods = "Command"; action = "Paste"; }
      #     { key = "C"; mods = "Command"; action = "Copy"; }
      #     { key = "Key0"; mods = "Command"; action = "ResetFontSize"; }
      #     { key = "Equals"; mods = "Command"; action = "IncreaseFontSize"; }
      #     { key = "Subtract"; mods = "Command"; action = "DecreaseFontSize"; }
      #   ];
      # };
    # };

    # kitty = {
    #   enable = true;
    #   extraConfig = builtins.readFile ./kitty;
    # };

    topgrade = {
      enable = true;
      # extraConfig = builtins.readFile ./topgrade; #TODO: Add config file by chezmoi for now
    };

    eza = {
      enable = true;
      enableAliases = true;
      extraOptions = [
        "--group-directories-first"
        "--header"
      ];
    };

    # Deprecated and replaced with mise https://mise.jdx.dev/demo.html
    rtx = {
      enable = true;
      settings = {
        settings = {
          verbose = false;
          experimental = false;
          asdf_compat = true;
        };
      };
    };

  };
}
