{ pkgs, config, lib, ... }:
{
  programs.nixvim = {
    enable = true;
    imports = [
      ./config
    ];
  };
}
