{ pkgs, config, lib, ... }:
{
  home.file."~/.config/nvim".source = ./nvim;
  programs.neovim = {
    enable = true;
    withNodeJs = true;
    viAlias = true;
    withPython3 = true;
    extraLuaConfig = lib.fileContents ~/.config/nvim/init.lua;
  };
}
