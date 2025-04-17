{ config, pkgs, inputs, ... }:
{
  home.file = {
    ".config/hypr/hyprpaper.conf" = { 
      source = ./hyprpaper.conf; 
    };
  };
  programs.hyprpaper = {
    enable = true;
    };
  }
  services.hyprpaper.enable = true;
}
