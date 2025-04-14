{ config, pkgs, inputs, ... }:

{
  home.username = "alpha";
  home.homeDirectory = "/home/alpha";
  home.stateVersion = "24.05"; # Please read the comment before changing.
  imports = [
    ./hyprland
    ./nvim
    ./waybar
    ./dunst
    ./kitty
    ./rofi
    ./zsh
    ./waybar
    ./hypridle
  ];

  home.packages = with pkgs; [ 
    zoxide
    fzf
    direnv
    rustup
    pywal
    swww
    imagemagick
    playerctl
    brightnessctl
  ];

  home.file = { };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
  programs.lazygit.enable = true;

  programs.home-manager.enable = true;
}
