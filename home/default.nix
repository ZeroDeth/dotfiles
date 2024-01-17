# Better managaement https://github.com/srid/nixos-config/blob/master/home/default.nix
{ flake, ... }:
{
  imports = [
    # This loads ./neovim/default.nix - neovim configured for Haskell dev, and other things.
    ./neovim
    ./starship.nix
    ./terminal.nix

    # This loads ./aliases/default.nix
    ./aliases

    # Add more of your home-manager modules here.

  ];

  # Recommended Nix settings
  nix = {
    registry.nixpkgs.flake = flake.inputs.nixpkgs; # https://yusef.napora.org/blog/pinning-nixpkgs-flake/
  };
}
