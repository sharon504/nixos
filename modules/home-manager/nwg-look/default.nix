{ pkgs, config, lib, ... }:
{
  home.file = {
    ".config/gtk-4.0" = {
      source = ./gtk-4.0;
      recursive = true;
    };
    ".config/gtk-3.0" = {
      source = ./gtk-3.0;
      recursive = true;
    };
    ".config/nwg-look" = {
      source = ./nwg-look;
      recursive = true;
    };
  };
}
