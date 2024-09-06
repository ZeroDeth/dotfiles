{ pkgs, misc, lib, config, ... }:

{

  # Programs natively supported by home-manager.
  # https://github.com/nix-community/home-manager/blob/master/modules/modules.nix
  programs = {

    bat = {
      # Better 'cat'
      enable = true;
      config = {
        theme = "TwoDark";
        italic-text = "always";
        pager = "less -FR";
      };
    };

    # Type `z <pat>` to cd to some directory
    zoxide.enable = true; # Required home-manager-path
    # Type `<ctrl> + r` to fuzzy search your shell history
    fzf.enable = true;
    jq.enable = true;
    nix-index.enable = true;
    htop.enable = true;
    atuin.enable = true;
    gpg.enable = true;

    eza = {
      enable = true;
      enableBashIntegration = false;
      enableZshIntegration = true;
      enableFishIntegration = true;
      extraOptions = [
        "--group-directories-first"
        "--header"
      ];
    };

    # https://zero-to-flakes.com/direnv
    direnv = {
      enable = true;
      nix-direnv.enable = true;
      config = {
        global.load_dotenv = true;
        global.strict_env = true;
        global.hide_env_diff = true;
        global.warn_timeout = "400ms";
      };
    };

    dircolors = {
      enable = true;
      enableBashIntegration = false;
      enableZshIntegration = true;
      enableFishIntegration = true;
      extraConfig = ''
        TERM alacritty
      '';
      settings = {
        ".iso" = "01;31"; # .iso files bold red like .zip and other archives
        ".gpg" = "01;33"; # .gpg files bold yellow
        # Images to non-bold magenta instead of bold magenta like videos
        ".bmp" = "00;35";
        ".gif" = "00;35";
        ".jpeg" = "00;35";
        ".jpg" = "00;35";
        ".mjpeg" = "00;35";
        ".mjpg" = "00;35";
        ".mng" = "00;35";
        ".pbm" = "00;35";
        ".pcx" = "00;35";
        ".pgm" = "00;35";
        ".png" = "00;35";
        ".ppm" = "00;35";
        ".svg" = "00;35";
        ".svgz" = "00;35";
        ".tga" = "00;35";
        ".tif" = "00;35";
        ".tiff" = "00;35";
        ".webp" = "00;35";
        ".xbm" = "00;35";
        ".xpm" = "00;35";
      };
    };

    # alacritty = {
    #   enable = true;

    # settings = {
    #   env.TERM = "xterm-256color";

    #   key_bindings = [
    #     { key = "K"; mods = "Command"; chars = "ClearHistory"; }
    #     { key = "V"; mods = "Command"; action = "Paste"; }
    #     { key = "C"; mods = "Command"; action = "Copy"; }
    #     { key = "Key0"; mods = "Command"; action = "ResetFontSize"; }
    #     { key = "Equals"; mods = "Command"; action = "IncreaseFontSize"; }
    #     { key = "Subtract"; mods = "Command"; action = "DecreaseFontSize"; }
    #   ];
    # };
    # };

    # kitty = {
    #   enable = true;
    #   extraConfig = builtins.readFile ./kitty;
    # };

    topgrade = {
      enable = true;
      # extraConfig = builtins.readFile ./topgrade; #TODO: Add config file by chezmoi for now
    };

    # rtx deprecated and replaced with mise https://mise.jdx.dev/demo.html
    mise = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
    };

  };
}
