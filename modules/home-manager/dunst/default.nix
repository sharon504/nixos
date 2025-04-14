{ config, pkgs, ... }: 
{
  home.file.".config/dunst/" = {
    source = ./dunst;
    recursive = true;
  };
  services.dunst = {
    enable = true;
    configFile = ./dunstrc;
  };
}
