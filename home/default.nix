# Better managaement https://github.com/srid/nixos-config/blob/master/home/default.nix
{ flake, pkgs, pkgs-stable, lib, config, ... }:

let
  # Symlink macOS apps installed via Nix into ~/Applications
  nix-symlink-apps-macos = pkgs.writeShellScriptBin "nix-symlink-apps-macos" ''
    for app in $(find ~/Applications -name '*.app')
    do
      if test -L $app && [[ $(greadlink -f $app) == /nix/store/* ]]; then
        rm $app
      fi
    done
    for app in $(find ~/.nix-profile/Applications/ -name '*.app' -exec greadlink -f '{}' \;)
    do
      echo "symlinking $(basename $app) into ~/Applications"
      ln -s $app ~/Applications/$(basename $app)
    done
  '';
  getDefaultPackage = input: input.packages.${pkgs.system}.default;

  scripts = [
    nix-symlink-apps-macos
  ];

  unstable-packages = with pkgs; [

    ## Unix tools # TODO: Remove and install via flox
    # ripgrep # Better `grep`
    # fd
    # sd
    # tree

    ## Nix dev
    cachix
    nil # Nix language server
    nix-info
    nixpkgs-fmt
    nixci
    grc # Generic Colouriser
    nix-health
    lorri
    niv
    statix
    # vulnix
    fh # https://flakehub.com

    ## Dev
    # just # TODO: Remove and install via flox
    # tmate # TODO: Remove and install via flox

    ## Me
    gnupg
    pinentry_mac

    helix

    nodejs_18
    yarn

    ## Platform-non-specific Go (for local development)
    # go # Installed by mise
    # go_1_22
    # gopls
    # goimports
    # godoc
    # gotests # TODO: Remove and install via flox
    # gomodifytags # TODO: Remove and install via flox
    # impl # TODO: Remove and install via flox
    # golint # TODO: Remove and install via flox
    # gotools # TODO: Remove and install via flox
    # golangci-lint # https://github.com/golangci/golangci-lint # TODO: Remove and install via flox
    # ko # Build and deploy Go applications # TODO: Remove and install via flox

    fish
    iterm2
    alacritty
    kitty
    wezterm
    nushell
    starship
    # byobu # TODO: Remove and install via flox
    # tmux # TODO: Remove and install via flox
    # gtop
    # btop
    # ctop
    # duf # TODO: Remove and install via flox
    # thefuck # TODO: Remove and install via flox
    terminaltexteffects

    # glab   # GLab is an open source GitLab CLI tool that brings GitLab to your command line.
    # act # TODO: Remove and install via flox

    yq-go
    neofetch
    cheat
    python3
    # pre-commit # TODO: Remove and install via flox
    chezmoi
    # shellcheck # TODO: Remove and install via flox
    # chatgpt-cli # TODO: Remove and install via flox
    # tree-sitter
    topgrade
    # trash-cli # TODO: Remove and install via flox
    devbox
    prettyping
    # colmena
    # arkade # TODO: Remove and install via flox
    # go-task # https://taskfile.dev/ # TODO: Remove and install via flox

    # ntfy-sh

    docker
    # colima # TODO: Remove and install via flox
    # lima # TODO: Remove and install via flox

    ## Kubernetes
    # k9s

    (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

  stable-packages = with pkgs-stable; [

    nh
    # vscode # TODO: Remove and install via flox

  ];

  other-packages = pkgs: inputs: with pkgs; [

    (getDefaultPackage inputs.flox)
    (getDefaultPackage inputs.talhelper)

    ksctl # TODO: Overlays not working

    (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

in
{
  imports = [
    # ./dotfiles
    ./programs
    # Add more of your home-manager modules here.
    ./modules

  ];

  # Recommended Nix settings https://github.com/NixOS/nixpkgs/blob/nixos-23.11/nixos/modules/config/nix.nix
  nix = {
    package = pkgs.nixFlakes;
    settings = {
      trusted-users = [ "root" "zerodeth" ];

      substituters = [
        # cache mirror located in China
        # status: https://mirror.sjtu.edu.cn/
        # "https://mirror.sjtu.edu.cn/nix-channels/store"
        # status: https://mirrors.ustc.edu.cn/status/
        # "https://mirrors.ustc.edu.cn/nix-channels/store"

        "https://cache.flox.dev"
        "https://cache.nixos.org"
        "https://nix-community.cachix.org"
        "https://nix-gaming.cachix.org"
        "https://chaotic-nyx.cachix.org"
        "https://ezkea.cachix.org"
        "https://ai.cachix.org"
      ];

      trusted-public-keys = [
        # the default public key of cache.nixos.org, it's built-in, no need to add it here
        "flox-cache-public-1:7F4OyH7ZCnFhcze3fJdfyXYLQw/aV7GEed86nQ7IsOs="
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
        "nyx.chaotic.cx-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
        "chaotic-nyx.cachix.org-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
        "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
        "ai.cachix.org-1:N9dzRK+alWwoKXQlnn0H6aUx0lU/mspIoz8hMvGvbbc="
      ];

      accept-flake-config = true;
      auto-optimise-store = true;

      keep-outputs = false; # Nice for developers, if true
      keep-derivations = false; # Idem, if true
    };

    # nix show-derivation --extra-experimental-features nix-command $(ls /nix/store/*.drv | head -n 1)
    # nix show-derivation --extra-experimental-features nix-command $(find /nix/store -maxdepth 1 -name '*.drv' | head -n 1)
    extraOptions = lib.optionalString (config.nix.package == pkgs.nixFlakes)
      "experimental-features = nix-command flakes";

    registry.nixpkgs.flake = flake.inputs.nixpkgs; # https://yusef.napora.org/blog/pinning-nixpkgs-flake/
  };

  nixpkgs = {
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);

      allowBroken = false;
    };
  };

  home.sessionVariables = {
    LANG = "en_GB.UTF-8";
    LC_CTYPE = "en_GB.UTF-8";
    LC_ALL = "en_GB.UTF-8";
    EDITOR = "nvim";
    PAGER = "less -FirSwX";
    # MANPAGER = "${manpager}/bin/manpager";
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
    "$HOME/.local/share/mise/shims"
  ];

  home.packages =
    unstable-packages
    ++ stable-packages
    ++ (other-packages pkgs flake.inputs)
    ++ scripts;

  fonts.fontconfig.enable = true;

  news.display = "silent";

}
