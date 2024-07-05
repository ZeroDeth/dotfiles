{
  description = "A home-manager template providing useful tools & settings for Nix-based development";

  inputs = {
    # Principle inputs (updated by `nix run .#update`)
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    flake-parts.url = "github:hercules-ci/flake-parts";
    nixos-flake.url = "github:srid/nixos-flake";

    # see https://github.com/nix-systems/default/blob/main/default.nix
    systems.url = "github:nix-systems/default";

    terminaltexteffects.url = "github:ChrisBuilds/terminaltexteffects/4ba5438e94c43ba46cf37a4edcecdcebbd18e3b2";
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;
      imports = [
        inputs.nixos-flake.flakeModule
      ];

      flake.templates.default = {
        description = "A `home-manager` template providing useful tools & settings for Nix-based development";
        path = builtins.path {
          path = ./.;
          filter = path: _: with inputs.nixpkgs.lib;
            !(hasSuffix "LICENSE" path ||
              hasSuffix "README.md" path ||
              hasSuffix "flake.lock" path);
        };
      };

      perSystem = { self', pkgs, ... }:
        let
          # TODO: Change username
          myUserName = "zerodeth";
          # terminaltexteffects = inputs.terminaltexteffects.packages.${pkgs.system}.default;
        in
        {
          legacyPackages.homeConfigurations.${myUserName} =
            inputs.self.nixos-flake.lib.mkHomeConfiguration
              pkgs
              ({ pkgs, ... }: {
                # Edit the contents of the ./home directory to install packages and modify dotfile configuration in your
                # $HOME.
                #
                # https://nix-community.github.io/home-manager/index.xhtml#sec-usage-configuration
                imports = [ ./home ];
                home.username = myUserName;
                home.homeDirectory = "/${if pkgs.stdenv.isDarwin then "Users" else "home"}/${myUserName}";
                home.stateVersion = "23.11"; # TODO: Update to 24.05

                programs.home-manager.enable = false;

                # Add this line to make terminaltexteffects available
                nixpkgs.overlays = [
                  (final: prev: {
                    terminaltexteffects = inputs.terminaltexteffects.packages.${pkgs.system}.default;
                  })
                  (import ./home/overlays)
                ];
              });

          formatter = pkgs.nixpkgs-fmt;

          # Enables 'nix run' to activate with additional flexibility
          apps.default.program = pkgs.writeShellApplication {
            name = "activate-home";
            text = ''
              set -e
              echo "Activating home-manager configuration for ${myUserName}..."
              ${self'.packages.default}/activate
              echo "Activation complete!"
            '';
          };

          # Enable 'nix build' to build the home configuration, but without activating.
          packages.default = self'.legacyPackages.homeConfigurations.${myUserName}.activationPackage;

          devShells.default = pkgs.mkShell {
            name = "nix-zero-home";
            nativeBuildInputs = with pkgs; [ just ];
          };
        };
    };
}
