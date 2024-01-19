{ config, pkgs, ... }: {

  imports = [
    ./shells
    # This loads ./neovim/default.nix - neovim configured for Haskell dev, and other things.
    ./neovim
    # ./kitty
  ];

}
