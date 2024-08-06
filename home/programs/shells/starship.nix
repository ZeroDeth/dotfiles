{ pkgs, ... }:

let
  settings = pkgs.lib.importTOML ./starship.toml;
in
{
  # Starship configuration from this example:
  # https://github.com/srid/nixos-config/blob/f9cf0def19fbc7aa1e836be481ce50d214e34036/home/starship.nix#L4-L19
  programs.starship = {
    enable = true;
    enableBashIntegration = false;
    enableZshIntegration = true;
    enableFishIntegration = true;
    # Configuration written to ~/.config/starship.toml
    # settings = {
    #   add_newline = true;

    #   git_branch = {
    #     disabled = false;
    #     symbol = " ";
    #     style = "bold purple";
    #     always_show_remote = true;
    #     only_attached = false;
    #   };

    #   time = {
    #     disabled = true;
    #     use_12hr = true;
    #     time_format = "'%T'";
    #     utc_time_offset = "'local'";
    #   };

    #   # character = {
    #   #   success_symbol = "[➜](bold green)";
    #   #   error_symbol = "[➜](bold red)";
    #   # };

    #   directory = {
    #     style = "blue";
    #     truncate_to_repo = false;
    #     truncation_length = 8;
    #   };

    #   username = {
    #     disabled = true;
    #     show_always = true;
    #     style_user = "blue bold";
    #     style_root = "red bold";
    #     format = "[$user]($style) ";
    #   };

    #   hostname = {
    #     disabled = false;
    #     style = "bold green";
    #     ssh_only = true;
    #     ssh_symbol = "🌏 ";
    #     trim_at = ".local";
    #   };

    #   package.disabled = false;
    #   golang.disabled = false;
    #   python.disabled = false;
    #   ruby.disabled = false;
    #   kubernetes.disabled = false;
    #   aws.disabled = false;
    #   gcloud = {
    #     disabled = false;
    #     symbol = "☁️ ";
    #     # format = "'[$symbol$active]($style)'";
    #     format = "on [$symbol$account(@$domain)(\($project\))]($style) ";
    #     style = "bold yellow";
    #     region_aliases = {
    #       europe-west1 = "ew1";
    #       europe-west2 = "ew2";
    #     };
    #     project_aliases = {
    #       management = "mgmt";
    #       production-core = "prd-core";
    #       staging-core = "stg-core";
    #       testing-core = "tst-core";
    #       production-earth = "prd-earth";
    #       staging-earth = "stg-earth";
    #       testing-earth = "testnet-earth";
    #     };
    #   };
    # };
    settings = settings;
  };

  # xdg.configFile."starship.toml".source = ./starship.toml;
}
