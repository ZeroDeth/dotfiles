{ pkgs, misc, lib, config, ... }:

{


  #---------------------------------------------------------------------
  # Programs
  #---------------------------------------------------------------------

  # Programs natively supported by home-manager.
  # https://github.com/nix-community/home-manager/blob/master/modules/modules.nix
  programs = {
    bat.enable = true;
    # Type `z <pat>` to cd to some directory
    zoxide.enable = true; # Required home-manager-path
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

      # extraConfig = builtins.readFile ./config; # TODO: Copied manual to "/nix/store/w64p0vgykzdrimvpnhhwj4h7sagpkqrn-source/home"
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
