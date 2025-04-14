{ pkgs, config, lib, ... }:
{
  services.kanata = {
    enable = true;
    keyboards = {
      internalKeyboard = {
        config = builtins.readFile ./kanata/config.kbd;
        extraDefCfg = "process-unmapped-keys yes";
      };
    };
  };
}
