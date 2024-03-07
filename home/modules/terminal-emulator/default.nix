{ config, pkgs, ... }: {

  imports = [
    # ./k8s
    ./alacritty
    ./kitty
    ./wezterm
  ];

}
