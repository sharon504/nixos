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
    ./kanata
    ./kitty
    ./rofi
    ./zsh
    ./waybar
  ];

  home.packages = [ ];

  home.file = { };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
  programs.lazygit.enable = true;

  programs.home-manager.enable = true;
}
