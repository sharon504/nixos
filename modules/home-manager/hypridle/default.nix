{ config, lib, pkgs, ... }:

{
  home.file = {
    ".config/hypr/hypridle.conf" = ./hyprildle.conf;
  };
  # Hypridle configuration
  services.hypridle = {
    enable = true;
  };
}
