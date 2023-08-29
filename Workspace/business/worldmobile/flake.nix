{
  description = "Google Cloud & DigitalOcean with Nix";

  # https://discourse.nixos.org/t/how-to-set-up-cachix-in-flake-based-nixos-config/31781/2
  # nixConfig: To prompt the user for confirmation
  nixConfig = {
      extra-substituters = [
        "https://nix-community.cachix.org"
      ];
      extra-trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };

  inputs = {
    # for nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/release-23.05";
    nixpkgs-unstable.url = github:NixOS/nixpkgs/nixpkgs-unstable;
    flake-utils.url = github:numtide/flake-utils;
    darwin.url = "github:LnL7/nix-darwin";
  };

  outputs =
    { self, # A reference to the Flake itself
      nixpkgs,
      nixpkgs-unstable,
      flake-utils,
      darwin
    }:
    flake-utils.lib.eachDefaultSystem (system:
    let
      goVersion = 20; # Change this to update the whole stack
      overlays = [
         (self: super: {
           go = super."go_1_${toString goVersion}";
          })
         ];

      pkgs = import nixpkgs-unstable {
        inherit overlays system;
        config.allowUnsupportedSystem = true;
        };
    in
    {
      devShells.default = pkgs.mkShellNoCC {
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

            ## Kubernetes
            # kubectl
            kubectx
            kustomize
            # kubernetes-helm
            # linkerd
            # velero
            # tracee
            # cilium-cli
            # kubeshark
            # k3d
	          # k0s
	          # microk8s
            # kubebuilder

            ## cluster management tool
            k9s
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
            vault

            ## Terraform
            # terraform
            terraform-ls
            tflint
            terraform-docs              #0.16.0
            tfsec
            # terrascan
            infracost                   #0.9.22
            # terraformer
            graphviz
            gawk

            ## Code tools
            # pre-commit
            checkov

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
            figlet "World Mobile" | lolcat --freq 0.5

            #unset LC_ALL LANG
            # or set it to a known locale, e.g.
            #export LC_ALL=C LANG=C

            echo "Go `${pkgs.go}/bin/go version`"
            # echo "Google Cloud `${pkgs.google-cloud-sdk}/bin/gcloud version`"
            # echo "DigitalOcean `${pkgs.doctl}/bin/doctl version`"
            # echo "Terraform `${pkgs.terraform}/bin/terraform version`"
            echo "Infracost `${pkgs.infracost}/bin/infracost --version`"
            echo "Docker `${pkgs.docker}/bin/docker version`"
            echo "k3d `${pkgs.k3d}/bin/k3d version`"
            echo "Kubernetes `${pkgs.kubectl}/bin/kubectl version --short`"
            # echo "ArgocD `${pkgs.argocd}/bin/argocd version`"
            # echo "Kustomize `${pkgs.kustomize}/bin/kustomize version`"
            # echo "Velero `${pkgs.velero}/bin/velero version`"
            # echo "Linkerd `${pkgs.linkerd}/bin/linkerd version`"
            # echo "Cilium `${pkgs.cilium-cli}/bin/cilium version`"
            # echo "kubebuilder `${pkgs.kubebuilder}/bin/kubebuilder version`"
          '';
      };
    });
}
