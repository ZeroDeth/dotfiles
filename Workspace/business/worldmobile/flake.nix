{
  description = "Google Cloud & DigitalOcean with Nix";

  inputs = {
    # for nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/release-23.05";
    nixpkgs-unstable.url = github:NixOS/nixpkgs/nixpkgs-unstable;
    flake-utils.url = github:numtide/flake-utils;
  };

  outputs =
    { self
    , nixpkgs
    , nixpkgs-unstable
    , flake-utils
    }:

    flake-utils.lib.eachDefaultSystem (system:
    let
      goVersion = 19;
      overlays = [ (self: super: { go = super."go_1_${toString goVersion}"; }) ];
      pkgs = import nixpkgs-unstable { inherit overlays system; config.allowUnsupportedSystem = true; };
    in
    {
      devShells.default = pkgs.mkShellNoCC {
        packages = with pkgs;
          [
            figlet              # Output text as big ASCII art text
            lolcat              # Make console output raibow colored

            ## Platform-non-specific Go (for local development)
            # go
            # gopls
            gotests
            gomodifytags
            impl
            golint
            gotools

            ## Docker CLI
            # docker
            # docker-compose

            ## Kubernetes
            # kubectl
            kubectx
            # kustomize
            # kubernetes-helm
            linkerd
            # velero
            # tracee
            cilium-cli
            kubeshark
            k3d
            kubebuilder

            ## cluster management tool
            # k9s
            # lens
            # krew
            # kubecolor            #TODO: nixos-unstable has this, update channel to use it.

            ## Argo
            argo
            argocd
            # argo-rollouts

            ## Terraform
            # terraform
            terraform-ls
            tflint
            terraform-docs              #0.16.0
            tfsec
            # terrascan
            infracost                   #0.9.22
            terraformer
            graphviz
            gawk

            ## Code tools
            # pre-commit
            checkov

            ## Google Cloud
            # Ref: https://github.com/michielboekhoff/nixos-conf/blob/37d2a6f7b4d5c266346b270f5da5db82613eb945/hosts/kyoshi/default.nix#L19
            # (google-cloud-sdk.withExtraComponents [google-cloud-sdk.components.gke-gcloud-auth-plugin google-cloud-sdk.components.cloud-build-local])

            ## Digital Ocean
            doctl

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
            echo "DigitalOcean `${pkgs.doctl}/bin/doctl version`"
            # echo "Terraform `${pkgs.terraform}/bin/terraform version`"
            echo "Infracost `${pkgs.infracost}/bin/infracost --version`"
            echo "Docker `${pkgs.docker}/bin/docker version`"
            echo "k3d `${pkgs.k3d}/bin/k3d version`"
            echo "Kubernetes `${pkgs.kubectl}/bin/kubectl version --short`"
            echo "ArgocD `${pkgs.argocd}/bin/argocd version`"
            # echo "Kustomize `${pkgs.kustomize}/bin/kustomize version`"
            # echo "Velero `${pkgs.velero}/bin/velero version`"
            echo "Linkerd `${pkgs.linkerd}/bin/linkerd version`"
            echo "Cilium `${pkgs.cilium-cli}/bin/cilium version`"
            echo "kubebuilder `${pkgs.kubebuilder}/bin/kubebuilder version`"
          '';
      };
    });
}
