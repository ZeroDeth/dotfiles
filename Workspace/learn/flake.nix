{
  description = "Learn";

  # https://discourse.nixos.org/t/how-to-set-up-cachix-in-flake-based-nixos-config/31781/2
  # nixConfig: To prompt the user for confirmation
  # nixConfig = {
  #     extra-substituters = [
  #       "https://nix-community.cachix.org"
  #     ];
  #     extra-trusted-public-keys = [
  #       "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
  #     ];
  #   };

  inputs = {
    # for nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/release-23.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    # flake-utils.url = "github:numtide/flake-utils";
    # darwin.url = "github:LnL7/nix-darwin";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable }:
    let
      goVersion = 22; # Change this to update the whole stack
      overlays = [
        (final: prev: { go = prev."go_1_${toString goVersion}"; })
        (self: super: {
          # znix -p nix-prefetch-github --run "nix-prefetch-github --rev v0.31.9 derailed k9s"
          # This cmd build k9s package from Nix store and then run k9s version cmd to check the version directly from built package.
          # $(nix-build '<nixpkgs>' -A k9s)/bin/k9s version
          k9s =
            let
              version = "0.31.9";
              src = super.fetchFromGitHub {
                owner = "derailed";
                repo = "k9s";
                rev = "v${version}";
                sha256 ="sha256-yPSAHqnGdLW2a2TCR7HPl8e5WlG+ruHwITATtivtBnw=";
              };
            in
            super.k9s.override rec {
              buildGoModule = args: super.buildGoModule (args // {
                inherit src version;
                vendorHash = "sha256-sha256-roHFUKH72BSzqZp2qh/Hw7rfTXj9yqpJyB2dozUz+Y8=";
              });
            };
          # fnix -p nix-prefetch-github --run "nix-prefetch-github --rev v0.10.32 infracost infracost"
          # infracost =
          #   let
          #     version = "0.10.32"; # Update this to the version you want
          #     src = super.fetchFromGitHub {
          #       owner = "infracost";
          #       repo = "infracost";
          #       rev = "v${version}";
          #       sha256 = "sha256-/GXT8ptoE6AjW0yTyQ8oLFqok59hIu+bOoE8FpdrOrY="; # Update this with the correct sha256
          #     };
          #   in
          #   super.buildGoModule rec {
          #     inherit src version;
          #     pname = "infracost";
          #     vendorHash = "sha256-ji9TpUcq0aUAn5vV5dnaC15i0Uli2Qsz/BrOKB3/Rl4="; # Update this with the correct vendorSha256
          #   };
          # fnix -p nix-prefetch-github --run "nix-prefetch-github --rev v0.0.16 iximiuz cdebug"
          # cdebug =
          #   let
          #     version = "0.0.16"; # Update this to the version you want
          #     src = super.fetchFromGitHub {
          #       owner = "iximiuz";
          #       repo = "cdebug";
          #       rev = "v${version}";
          #       sha256 = "sha256-rt5z7NayxDjwJHzng8GyUIehBEkmoSb/0qNrwBO8KdU="; # Update this with the correct sha256
          #     };
          #   in
          #   super.buildGoModule rec {
          #     inherit src version;
          #     pname = "cdebug";
          #     vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="; # Update this with the correct vendorSha256

          #     # Specify the Go version
          #     go = super.go_1_22; # Use Go 1.22
          #   };
        })
      ];
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
        pkgs = import nixpkgs-unstable { inherit overlays system; config.allowUnsupportedSystem = true; config.allowUnfree = true; config.permittedInsecurePackages = false; };
      });
    in
    {
      devShells = forEachSupportedSystem ({ pkgs }: {
        default = pkgs.mkShell {
          packages = with pkgs;
          [
            figlet              # Output text as big ASCII art text
            lolcat              # Make console output raibow colored

            ## Platform-non-specific Go (for local development)
            # go 1.20 (specified by overlay)
            go
            # gopls
            # goimports
            # godoc
            gotests
            gomodifytags
            impl
            golint
            gotools

            # https://github.com/golangci/golangci-lint
            golangci-lint

            ## Docker CLI
            # docker
            # docker-compose

            ## Podman CLI
            # podman
            # podman-compose

            ## Kubernetes
            # kubectl
            kubectx
            kustomize
            # kubernetes-helm
            # helm-docs
            # linkerd
            # velero
            # tracee
            # cilium-cli
            # kubeshark
            # kind
            # k3d
	          # k0s
	          # microk8s
            # kubebuilder
            # cdebug

            ## cluster management tool
            # k9s                  #v0.32.4 #TODO: installed by brew
            # lens
	          # octant
            # krew
            # kubecolor            #TODO: nixos-unstable has this, update channel to use it.
            # timoni

            ## Argo
            # argo
            # argocd
            # argo-rollouts

            ## HashiCorp
            # vault

            ## Terraform
            # terraform
            terraform-ls
            tflint
            terraform-docs           #0.16.0
            tfsec
            # terrascan
            # infracost                #v0.10.32
            # terraformer
            graphviz
            gawk

            ## Code tools
            # pre-commit
            # checkov

            ## Google Cloud
            # Ref: https://github.com/michielboekhoff/nixos-conf/blob/37d2a6f7b4d5c266346b270f5da5db82613eb945/hosts/kyoshi/default.nix#L19
            # (google-cloud-sdk.withExtraComponents [google-cloud-sdk.components.gke-gcloud-auth-plugin google-cloud-sdk.components.cloud-build-local])

            ## Digital Ocean
            # doctl

            ## VPN #TODO: move from homebrew
            # wireguard-go
            # wireguard-tools

          ];

          shellHook = ''
            figlet "Learn" | lolcat --freq 0.5

            #unset LC_ALL LANG
            # or set it to a known locale, e.g.
            #export LC_ALL=C LANG=C

            # https://stackoverflow.com/a/72560928/6611169
            # export DOCKER_HOST="unix://$HOME/.colima/docker.sock"

            echo "Go `${pkgs.go}/bin/go version`"
            # echo "Google Cloud `${pkgs.google-cloud-sdk}/bin/gcloud version`"
            # echo "DigitalOcean `${pkgs.doctl}/bin/doctl version`"
            # echo "Terraform `${pkgs.terraform}/bin/terraform version`"
            # echo "Infracost `${pkgs.infracost}/bin/infracost --version`"
            echo "Docker `${pkgs.docker}/bin/docker version`"
            # echo "k3d `${pkgs.k3d}/bin/k3d version`"
            echo "Kubernetes `${pkgs.kubectl}/bin/kubectl version`"
            # echo "ArgocD `${pkgs.argocd}/bin/argocd version`"
            # echo "Kustomize `${pkgs.kustomize}/bin/kustomize version`"
            # echo "Velero `${pkgs.velero}/bin/velero version`"
            # echo "Linkerd `${pkgs.linkerd}/bin/linkerd version`"
            # echo "Cilium `${pkgs.cilium-cli}/bin/cilium version`"
            # echo "kubebuilder `${pkgs.kubebuilder}/bin/kubebuilder version`"
          '';
      };
    });
  };
}
