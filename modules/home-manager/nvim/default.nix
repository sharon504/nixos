{ pkgs, config, lib, ... }:
{
  home.file = {
    ".config/nvim" = {
      source = ./nvim;
      recursive = true;
    };
  };
  programs.neovim = {
    enable = true;
    withNodeJs = true;
    viAlias = true;
    withPython3 = true;
    extraLuaConfig = lib.fileContents ./nvim/init.lua;
  };
}
