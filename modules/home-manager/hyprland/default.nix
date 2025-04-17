{ config, pkgs, ... }:
{
  home.file.".config/hypr/" = {
    source = ./hypr;
    recursive = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ./hypr/hyprland.conf;
    xwayland = {
      enable = true;
    };
  };

  programs.hyprlock = {
    enable = true;
    extraConfig = builtins.readFile ./hypr/hyprlock.conf;
  };

}

