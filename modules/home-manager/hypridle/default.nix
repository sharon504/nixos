{ config, lib, pkgs, ... }:

{
  # Hypridle configuration
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listeners = [
        # Brightness dimming
        {
          timeout = 150;
          "on-timeout" = "brightnessctl -s set 10";
          on-resume = "brightnessctl -r";
        }

        # Keyboard backlight
        {
          timeout = 150;
          "on-timeout" = "brightnessctl -sd rgb:kbd_backlight set 0";
          "on-resume" = "brightnessctl -rd rgb:kbd_backlight";
        }

        # Lock session
        {
          timeout = 300;
          "on-timeout" = "loginctl lock-session";
        }

        # DPMS (Display Power Management Signaling)
        {
          timeout = 330;
          "on-timeout" = "hyprctl dispatch dpms off";
          "on-resume" = "hyprctl dispatch dpms on";
        }

        # System suspend
        {
          timeout = 1800;
          "on-timeout" = "systemctl suspend";
        }
      ];
    };
  };
}
