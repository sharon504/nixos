{ config, pkgs, ... }:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = "~/dotfiles/wallpapers/wallpaper";
      wallpaper = ",~/dotfiles/wallpapers/wallpaper";
      splash = "true";
    };
  };
}
