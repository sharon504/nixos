{ config, pkgs, ... }:
{
  home.file.".config/hypr/".source = ./hypr;
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ./hypr/hyprland.conf;
  };
}

