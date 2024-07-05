{ lib, fetchFromGitHub, buildGoModule }:

let
  version = "1.2.4"; # Define the version here
in
buildGoModule {
  pname = "ksctl";
  inherit version;

  src = fetchFromGitHub {
    owner = "ksctl";
    repo = "ksctl";
    rev = "v${version}";
    hash = "sha256-Cty6ktzIpWj6Fg9tMIsEWlRukme82vAojcKkrFr9fIA="; # Use correct hash
  };

  vendorHash = null; # Changed from vendorSha256 to vendorHash

  meta = with lib; {
    description = "Command line utility to manage Kubernetes clusters";
    homepage = "https://github.com/ksctl/ksctl";
    license = licenses.mit;
    maintainers = [ ];
  };
}
