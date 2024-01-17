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

    # Dev
    just
    lazygit # Better git UI
    tmate

    nix-health

     # Me
     gnupg
     pinentry_mac
     pre-commit
     chezmoi
     topgrade
     colmena

     arkade
     fh

     docker
     colima
     lima

    (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];
  fonts.fontconfig.enable = true;

  home.shellAliases = {
    g = "git";
    lg = "lazygit";
  };

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
  };

  # Programs natively supported by home-manager.
  programs = {
    bat.enable = true;
    # Type `z <pat>` to cd to some directory
    zoxide.enable = true;
    # Type `<ctrl> + r` to fuzzy search your shell history
    fzf.enable = true;
    jq.enable = true;
    nix-index.enable = true;
    htop.enable = true;


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
    };

    # https://zero-to-flakes.com/direnv
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    # https://nixos.asia/en/git
    # git = {
    #   enable = true;
    #   # userName = "John Doe";
    #   # userEmail = "johndoe@example.com";
    #   extraConfig = {
    #     # init.defaultBranch = "master";
    #   };
    # };

    zoxide = {
        # enable = true;
        enableBashIntegration = true;
        enableZshIntegration = true;
        enableFishIntegration = true;
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

  };
}
