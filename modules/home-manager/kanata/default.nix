{ pkgs, config, lib, ... }:
{
  home.file = {
    ".config/kanata" = {
      source = ./kanata;
      recursive = true;
    };
  };
  services.kanata = {
    enable = true;
    extraConfig = builtins.readFile ./kanata/config.kbd;
  };
}
