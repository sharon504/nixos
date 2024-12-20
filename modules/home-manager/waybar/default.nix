{
  home.file.".config/waybar/mocha.css" = { source = ./waybar/mocha.css; };
  programs.waybar = {
    enable = true;
    style = builtins.readFile ./waybar/style.css;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";

        modules-left = [ "wlr/workspaces" ];
        modules-center = [ "custom/music" ];
        modules-right = [
          "pulseaudio"
          "backlight"
          "battery"
          "clock"
          "tray"
          "custom/lock"
          "custom/power"
        ];

        "wlr/workspaces" = {
          disable-scroll = true;
          sort-by-name = true;
          format = " {icon} ";
          format-icons = {
            "1" = "󰲡";
            "2" = "󰲣";
            "3" = "󰲥";
            "4" = "󰲧";
            "5" = "󰲩";
            "6" = "󰲫";
            "7" = "󰲭";
            "8" = "󰲯";
            "9" = "󰲱";
            "10" = "󰲳";
            default = "󰄱";
          };
        };

        tray = {
          icon-size = 21;
          spacing = 10;
        };

        "custom/music" = {
          format = "  {}";
          escape = true;
          interval = 5;
          tooltip = false;
          exec = "playerctl metadata --format='{{ title }}'";
          on-click = "playerctl play-pause";
          max-length = 50;
        };

        clock = {
          timezone = "Asia/Dubai";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = " 󰸗 {:%d/%m/%Y}";
          format = " 󰥔 {:%H:%M}";
        };

        backlight = {
          device = "intel_backlight";
          format = "{icon}";
          format-icons = [
            "󱩎"
            "󱩏"
            "󱩐"
            "󱩑"
            "󱩒"
            "󱩓"
            "󱩔"
            "󱩕"
            "󱩖"
            "󰛨"
          ];
        };

        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-plugged = "󰚥 {capacity}%";
          format-alt = "{icon} {time}";
          format-icons = [
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
            "󰂃"
            "󰂄"
            "󰂅"
          ];
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "󰝟";
          format-icons = {
            default = [ "󰕿" "󰖀" "󰕾" ];
          };
          on-click = "pavucontrol";
        };

        "custom/lock" = {
          tooltip = false;
          on-click = "sh -c '(sleep 0.5s; swaylock --grace 0)' & disown";
          format = "󰍁";
        };

        "custom/power" = {
          tooltip = false;
          on-click = "wlogout &";
          format = "󰐥";
        };
      };
    };
  };
}
