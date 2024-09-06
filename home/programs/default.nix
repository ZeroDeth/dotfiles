{ config, pkgs, ... }: {

  imports = [
    # Platform-independent terminal setup
    ./shells
    # This loads ./neovim/default.nix - neovim configured for Haskell dev, and other things.
    ./neovim
  ];

}
