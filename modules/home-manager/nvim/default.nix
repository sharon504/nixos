{ config, lib, pkgs, ... }:
{
  programs.nixvim = {
    enable = true;
    imports = [
      ./config
    ];
  };

}
