{ config, pkgs, ... }:
{
  home.file.".config/hypr/" = {
    source = ./hypr;
    recursive = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
    };
    extraConfig = '''';
  };

  programs.hyprlock = {
    enable = true;
    extraConfig = builtins.readFile ./hypr/hyprlock.conf;
  };

}

