{ lib, fetchFromGitHub, buildGoModule }:

let
  version = "1.2.4";
in
buildGoModule rec {
  pname = "ksctl";
  inherit version;

  src = fetchFromGitHub {
    owner = "ksctl";
    repo = "ksctl";
    rev = "v${version}";
    hash = "sha256-Cty6ktzIpWj6Fg9tMIsEWlRukme82vAojcKkrFr9fIA="; # Use correct hash
  };

  vendorHash = "sha256-lbsA2xpfAYirZmJ5oNL+GejtC1XEF3Ut+mMFxdcR0ng=";

  goModVendor = true; # Enable go mod vendor

  doCheck = false; # Disable the tests

  meta = with lib; {
    description = "Command line utility to manage Kubernetes clusters";
    homepage = "https://github.com/ksctl/ksctl";
    license = licenses.mit;
    maintainers = [ ];
  };
}
