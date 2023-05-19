{
  description = "Google Cloud & DigitalOcean with Nix";

  inputs = {
    # for nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/release-22.11";
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

            ## Docker CLI
            # docker

            ## Kubernetes
            # kubectl
            kubectx
            # kustomize
            # kubernetes-helm
            linkerd
            velero
            # tracee

            ## cluster management tool
            k9s
            # lens
            krew
            kubecolor            #TODO: nixos-unstable has this, update channel to use it.

            ## Argo
            argo
            argocd
            argo-rollouts

            ## Terraform
            # terraform
            terraform-ls
            tflint
            terraform-docs              #0.16.0
            tfsec
            terrascan
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
          ];

          shellHook = ''
            figlet "World Mobile!" | lolcat --freq 0.5
            echo "Go `${pkgs.go}/bin/go version`"
            echo "Google Cloud `${pkgs.google-cloud-sdk}/bin/gcloud version`"
            echo "DigitalOcean `${pkgs.doctl}/bin/doctl version`"
            # echo "Terraform `${pkgs.terraform}/bin/terraform version`"
            echo "Docker `${pkgs.docker}/bin/docker version`"
            echo "Kubernetes `${pkgs.kubectl}/bin/kubectl version`"
            echo "Velero `${pkgs.kubectl}/bin/velero version`"
            echo "Linkerd `${pkgs.kubectl}/bin/linkerd version`"
            echo "Velero `${pkgs.kubectl}/bin/velero version`"
          '';
      };
    });
}
