{ config, pkgs, inputs, ... }:

{
  home.username = "alpha";
  home.homeDirectory = "/home/alpha";
  home.stateVersion = "24.05"; # Please read the comment before changing.
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ../../modules/home-manager/hyprland
    ../../modules/home-manager/nvim
  ];

  home.packages = [
  ];

  home.file = { };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
