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
    eza
    hyprpaper
    hypridle
  ];

  home.file = { };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
  programs.lazygit.enable = true;
  programs.git = {
    enable = true;
    extraConfig = {
      user.name = "sharon504";
      user.email = "sharonpshajan@gmail.com";
    };
  };

  programs.home-manager.enable = true;
}
