{ config, pkgs, inputs, system, ... }:
{

  services = {
    libinput = { enable = true; };
    openssh = { enable = true; };
    pipewire = { enable = true; };
    udev.packages = [
      pkgs.android-udev-rules
    ];
    hypridle = { enable = true; };
    kanata = {
      enable = true;
    };
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = ''${pkgs.greetd.tuigreet}/bin/tuigreet \
                    --remember \
                    --remember-session \
                    --asterisks \
                    --time '';
          user = "greeter";
        };
      };
    };
  };

}
