{ pkgs, config, lib, ... }:
{
  services.kanata = {
    enable = true;
    keyboards = {
      configFile = builtins.readFile ./kanata/config.kbd;
    };
  };
}
