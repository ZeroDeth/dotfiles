{ pkgs, ... }: {

  imports = [
    ./zsh.nix
    ./fish.nix
    ./starship.nix
  ];
}
