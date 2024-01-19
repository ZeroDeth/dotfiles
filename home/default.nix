# Better managaement https://github.com/srid/nixos-config/blob/master/home/default.nix
{ flake, pkgs, misc, lib, config, ... }:

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
  scripts = [
    nix-symlink-apps-macos
  ];

in
{
  imports = [
    # ./dotfiles
    ./programs
    # Add more of your home-manager modules here.

  ];

  # Recommended Nix settings
  nix = {
    package = pkgs.nixFlakes;
    settings = {
      trusted-users = [ "root" "zeroddeth" ];

      substituters = [
        # cache mirror located in China
        # status: https://mirror.sjtu.edu.cn/
        # "https://mirror.sjtu.edu.cn/nix-channels/store"
        # status: https://mirrors.ustc.edu.cn/status/
        # "https://mirrors.ustc.edu.cn/nix-channels/store"

        "https://cache.nixos.org"
        "https://nix-community.cachix.org"
        "https://nix-gaming.cachix.org"
        "https://chaotic-nyx.cachix.org"
        "https://ezkea.cachix.org"
      ];

      trusted-public-keys = [
        # the default public key of cache.nixos.org, it's built-in, no need to add it here
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
        "nyx.chaotic.cx-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
        "chaotic-nyx.cachix.org-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
        "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
      ];

      accept-flake-config = true;
      auto-optimise-store = true;
    };

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

  news.display = "silent";

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

}
