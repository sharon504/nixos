{ config, pkgs, inputs, ... }:

{
  home.username = "alpha";
  home.homeDirectory = "/home/alpha";
  home.stateVersion = "24.05"; # Please read the comment before changing.
  imports = [
    ./greetd
    ./hyprland
    ./nvim
    ./waybar
    ./dunst
    ./kitty
    ./rofi
    ./zsh
    ./waybar
    ./hypridle
    ./tmux
    ./nwg-look
  ];

  gtk = {
    enable = true;
    theme = {
      name = "fluent-gtk-theme";
      package = pkgs.fluent-gtk-theme;
    };
    iconTheme = {
      name = "fluent-icon-theme";
      package = pkgs.fluent-icon-theme;
    };
  };

  home.packages = with pkgs; [ 
    zoxide
    fzf
    direnv
    rustup
    pywal
    swww
    imagemagick
    playerctl
    google-chrome
    brightnessctl
    eza
    hypridle
    yazi
    hyprshot
    ripgrep
    gnutar
    bzip2
    unrar
    gzip
    unzip
    p7zip
    tmux
    pnpm
    lazydocker
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
