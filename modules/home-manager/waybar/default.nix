{ config, pkgs, inputs, ... }:

{
  # Sync entire waybar config dir
  home.file.".config/waybar" = {
    source = ./waybar;
  };

  programs.waybar = {
    enable = true;

    # Waybar supports multiple bar configs, so this must be a list
    settings = [
      {
        layer = "top";
        "margin-top" = 4;
        "margin-bottom" = 0;
        height = 16;
        "margin-left" = 0;
        "margin-right" = 0;
        spacing = 0;

        # Load external modules
        include = [ "${config.home.homeDirectory}/dotfiles/waybar/modules.json" ];

        "modules-left" = [
          "custom/appmenu"
          "clock"
          "hyprland/window"
        ];

        "modules-center" = [
          "hyprland/workspaces"
        ];

        "modules-right" = [
          "group/quicklinks"
          "group/hardware"
          "pulseaudio"
          "network"
          "bluetooth"
          "battery"
        ];

        "group/quicklinks" = {
          orientation = "horizontal";
          modules = [
            "custom/filemanager"
            "custom/brave"
          ];
        };

        "group/hardware" = {
          orientation = "horizontal";
          modules = [
            "cpu"
            "memory"
          ];
        };
      }
    ];
  };
}

