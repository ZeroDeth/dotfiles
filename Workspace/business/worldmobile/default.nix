# nix-shell --pure --show-trace node-shell.nix
# nix develop -f node-shell.nix -c fish

/*
  How to consume Python modules using pip in a virtual environment like I am used to on other Operating Systems? {#how-to-consume-python-modules-using-pip-in-a-virtual-environment-like-i-am-used-to-on-other-operating-systems}
  https://github.com/NixOS/nixpkgs/blob/master/doc/languages-frameworks/python.section.md#how-to-consume-python-modules-using-pip-in-a-virtual-environment-like-i-am-used-to-on-other-operating-systems-how-to-consume-python-modules-using-pip-in-a-virtual-environment-like-i-am-used-to-on-other-operating-systems
*/

with import <nixpkgs> { config.allowUnsupportedSystem = true; };

let
  pythonPackages = python3Packages;
in
pkgs.mkShell rec {
  name = "impurePythonEnv";
  venvDir = "./.venv";
  buildInputs = [
    # A Python interpreter including the 'venv' module is required to bootstrap
    # the environment.
    pythonPackages.python

    # This execute some shell code to initialize a venv in $venvDir before
    # dropping into the shell
    pythonPackages.venvShellHook

    # Those are dependencies that we would like to use from nixpkgs, which will
    # add them to PYTHONPATH and thus make them accessible from within the venv.
    # pythonPackages.numpy
    # pythonPackages.requests

    # In this particular example, in order to compile any binary extensions they may
    # require, the Python modules listed in the hypothetical requirements.txt need
    # the following packages to be installed locally:
    # taglib
    # openssl
    # git
    # libxml2
    # libxslt
    # libzip
    # zlib

    google-cloud-sdk
    google-cloud-sdk-gce
    (
      google-cloud-sdk.withExtraComponents (
        [ google-cloud-sdk.components.gke-gcloud-auth-plugin ]
      )
    )

    # nodejs-16_x              #v16.13.2
    # yarn                     #1.22.17
    # terraform                  #1.0.11
    # terraform_0_15             #0.15.5
    # terraform-full             #1.0.11
    # terraform-ls               #v0.30.1-dev   #TODO: nix profile install #nixpkgs.terraform-ls
    terraform-docs #0.16.0
    tflint
    tfsec
    terrascan
    infracost #0.9.22
    terraformer
    # checkov
    pre-commit
    graphviz
    gawk

    act #Run your GitHub Actions locally

    pkgs.kubectl
    # pkgs.minikube
    pkgs.kustomize
    pkgs.kubernetes-helm

    # cluster management tool
    pkgs.k9s
    # pkgs.lens
    pkgs.krew
    pkgs.kubecolor #TODO: nixos-unstable has this, update channel to use it.
    # pkgs.kind                    # kubernetes in docker
  ];

  # Run this command, only after creating the virtual environment
  #   postVenvCreation = ''
  #     unset SOURCE_DATE_EPOCH
  #     pip install -r ../requirements.txt
  #   '';

  # Now we can execute any commands within the virtual environment.
  # This is optional and can be left out to run pip manually.
  postShellHook = ''
    # allow pip to install wheels
    unset SOURCE_DATE_EPOCH

    mkdir -p .nix-node
    export NODE_PATH=$PWD/.nix-node
    export NPM_CONFIG_PREFIX=$PWD/.nix-node
    export PATH=$NODE_PATH/bin:$PATH

    #npm install -g aws-cdk      #global not working

    node --version              #v16.13.2
    yarn --version              #1.22.17
    npm --version               #8.1.2
    #cdk --version               #2.20.0 (build 738ef49)
    terraform version           #0.15.5 #1.0.11
    python --version            #3.9.10
    pip --version               #21.2.4

    infracost --version         #0.9.22
    act --version               #0.2.42
    gcloud --version


  '';
}
