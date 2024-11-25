{ config, pkgs, ... }:
{
  services.hyprlock = {
    enable = true;
    settings = {
      background = {
        monitor = "";
        path = "~/dotfiles/wallpapers/wallpaper";
      };

      input-field = {
        monitor = "";
        size = "200, 50";
        outline-thickness = 3;
        dots-size = 0.33; # Scale of input-field height, 0.2 - 0.8
        dots-spacing = 0.15; # Scale of dots' absolute size, 0.0 - 1.0
        dots-center = true;
        dots-rounding = -1; # -1 default circle, -2 follow input-field rounding
        outer-color = "rgb(151515)";
        inner-color = "rgb(FFFFFF)";
        font-color = "rgb(10, 10, 10)";
        fade-on-empty = true;
        fade-timeout = 1000; # Milliseconds before fade_on_empty is triggered
        placeholder-text = "<i>Input Password...</i>"; # Text rendered in the input box when it's empty
        hide-input = false;
        rounding = -1; # -1 means complete rounding (circle/oval)
        check-color = "rgb(204, 136, 34)";
        fail-color = "rgb(204, 34, 34)"; # if authentication failed, changes outer_color and fail message color
        fail-text = "<i>$FAIL <b>($ATTEMPTS)</b></i>"; # can be set to empty
        fail-transition = 300; # transition time in ms between normal outer_color and fail_color
        capslock-color = -1;
        numlock-color = -1;
        bothlock-color = -1; # when both locks are active. -1 means don't change outer color
        invert-numlock = false; # change color if numlock is off
        swap-font-color = false;
        position = "0, -20";
        halign = "center";
        valign = "center";
      };

      labels = [
        {
          monitor = "";
          text = "cmd[update:1000] echo \"$TIME\"";
          color = "rgba(200, 200, 200, 1.0)";
          font-size = 55;
          font-family = "Fira Semibold";
          position = "-90, 70";
          halign = "right";
          valign = "bottom";
          shadow-passes = 5;
          shadow-size = 10;
        }
        {
          monitor = "";
          text = "$USER";
          color = "rgba(200, 200, 200, 1.0)";
          font-size = 20;
          font-family = "Fira Semibold";
          position = "-100, 160";
          halign = "right";
          valign = "bottom";
          shadow-passes = 5;
          shadow-size = 10;
        }
      ];
    };
  };
}
