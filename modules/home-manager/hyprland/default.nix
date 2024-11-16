{ config, pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    package = pkgs.hyprland.override { hyprland = pkgs.hyprland.hyprland-git; };
    settings = {
      monitor = "eDP-1,1920x1080@60,auto,1,bitdepth,10";

      "$terminal" = "kitty";
      "$fileManager" = "thunar";
      "$browser" = "zen-browser";
      "$taskmanager" = "kitty btop";
      env = [ "XCURSOR_SIZE,15" "QT_QPA_PLATFORMTHEME,qt5ct" ];
      input = {
        kb_layout = "us";
        touchpad = {
          natural_scroll = false;
          tap-to-click = true;
        };
        sensitivity = "0.5";
      };

      general = {
        gaps_in = "0";
        gaps_out = "0";
        border_size = "1";
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";

        layout = "dwindle";

        allow_tearing = false;
      };

      plugin = {
        overview = {
          overrideGaps = true;
          gapsIn = "5";
          gapsOut = "3";
          panelHeight = "190";
          workspaceMargin = "5";
        };
        hyprexpo = {
          columns = "3";
          gap_size = "5";
          bg_col = "rgb(111111)";
          workspace_method = "center current";
          enable_gesture = true;
          gesture_distance = "300";
          gesture_positive = true;
        };
      };



      decoration = {
        rounding = "5";
        blur = {
          enabled = true;
          size = "4";
          passes = "3";
          new_optimizations = true;
          xray = true;
          ignore_opacity = true;
        };
        drop_shadow = true;
        shadow_range = 2;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      };

      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = { pseudotile = true; preserve_split = true; };

      gestures = { workspace_swipe_fingers = "3"; workspace_swipe = true; };

      misc = { force_default_wallpaper = "0"; };
      device = { name = "epic-mouse-v1"; sensitivity = "1"; };

      "$mainMod" = "SUPER";
      windowrulev2 = [
        "suppressevent maximize, class:.*"
        "opacity 0.95 .92,class:^(kitty)$"
        "workspace 1, class:^(kitty)$"
        "workspace 2, class:^(zen-alpha)$"
        "workspace 2, class:^(Vivaldi-stable)$"
        "workspace 3, class:^(discord)$"
        "workspace 3, class:^(whatsdesk)$"
        "workspace 3, class:^(org.telegram.desktop)$"
        "workspace 4, class:^(Spotify)$"
        "workspace 5, class:^(qemu)$"
        "fullscreen, class:^(qemu)$"
        "workspace 6, class:^(kitty)$, title:^(btop)$, initialTitle:^(kitty)$"
        "stayfocused, class:^(Rofi)$"
        "workspace 5, class:^(obsidian)$"
      ];


      bind = [
        "$mainMod, RETURN, exec, $terminal -o font_size=13"
        "SUPER, grave, hyprexpo:expo, toggle"
        "$mainMod, B, exec, $browser" # browser
        "$mainMod, W, killactive," # kill active window
        "$mainMod, M, exit," # exit
        "$mainMod, E, exec, $fileManager" # file manager
        "$mainMod, V, togglefloating" # toggle floating
        "$mainMod, F, fullscreen" # fullscreen
        "$mainMod, SPACE, exec, $menu" # rofi launcher
        "$mainMod, P, pseudo" # dwindle
        "$mainMod SHIFT, R, exec, hyprctl reload" # reload config
        "$mainMod SHIFT, P, exec, systemctl poweroff" # shutdown
        "$mainMod SHIFT, Q, exec, systemctl reboot" # reboot
        "$mainMod, TAB, workspace, previous" # previous workspace
        "$mainMod, T, exec, $taskmanager" # task manager
        "$mainMod SHIFT, H, exec, pkill waybar" # kill waybar
        "$mainMod, U, exec, ~/.config/waybar/launch.sh" # waybar
        "$mainMod SHIFT, M, exec, LD_PRELOAD=/usr/local/lib/spotify-adblock.so spotify" # spotify
        "$mainMod SHIFT, L, exec, hyprlock" # lock screen
        "$mainMod, Q, exec, wlogout" # logout
        "$mainMod, D, exec, discord" # discord 
        ", Print, exec, hyprshot -m window" # screenshot
        "SHIFT, Print, exec, hyprshot -m region" # screenshot region
        ", XF86AudioRaiseVolume, exec, ~/.config/hypr/scripts/volume --inc " # volume up
        ", XF86AudioLowerVolume, exec, ~/.config/hypr/scripts/volume --dec " # volume down
        "$mainMod, bracketLeft, exec, ~/.config/hypr/scripts/volume --dec " # volume down
        "$mainMod, bracketRight, exec, ~/.config/hypr/scripts/volume --inc " # volume up
        ", XF86AudioMicMute, exec, ~/.config/hypr/scripts/volume --toggle-mic " # mute mic
        ", XF86AudioMute, exec, ~/.config/hypr/scripts/volume --toggle" # mute
        ", XF86AudioPlay, exec, playerctl play-pause" # play/pause
        ", XF86AudioPause, exec, playerctl play-pause" # play/pause
        ", Pause, exec, playerctl play-pause" # play/pause
        ", XF86AudioNext, exec, playerctl next" # next song
        ", XF86AudioPrev, exec, playerctl previous" # previous song
        ", XF86MonBrightnessUp, exec, ~/.config/hypr/scripts/backlight --inc " # increase backlight
        ", XF86MonBrightnessDown, exec, ~/.config/hypr/scripts/backlight --dec" # decrease backlight
        "$mainMod, h, movefocus, l" # move left
        "$mainMod, l, movefocus, r" # move right
        "$mainMod, k, movefocus, u" # move up
        "$mainMod, j, movefocus, d" # move down
        "$mainMod SHIFT, 1, movetoworkspace, 1" # move to workspace 1
        "$mainMod SHIFT, 2, movetoworkspace, 2" # move to workspace 2
        "$mainMod SHIFT, 3, movetoworkspace, 3" # move to workspace 3
        "$mainMod SHIFT, 4, movetoworkspace, 4" # move to workspace 4
        "$mainMod SHIFT, 5, movetoworkspace, 5" # move to workspace 5
        "$mainMod SHIFT, 6, movetoworkspace, 6" # move to workspace 6
        "$mainMod SHIFT, 7, movetoworkspace, 7" # move to workspace 7   
        "$mainMod SHIFT, 8, movetoworkspace, 8" # move to workspace 8
        "$mainMod SHIFT, 9, movetoworkspace, 9" # move to workspace 9
        "$mainMod SHIFT, 0, movetoworkspace, 10" # move to workspace 10
        "$mainMod, 1, workspace, 1" # switch to workspace 1
        "$mainMod, 2, workspace, 2" # switch to workspace 2
        "$mainMod, 3, workspace, 3" # switch to workspace 3
        "$mainMod, 4, workspace, 4" # switch to workspace 4
        "$mainMod, 5, workspace, 5" # switch to workspace 5
        "$mainMod, 6, workspace, 6" # switch to workspace 6
        "$mainMod, 7, workspace, 7" # switch to workspace 7
        "$mainMod, 8, workspace, 8" # switch to workspace 8
        "$mainMod, 9, workspace, 9" # switch to workspace 9
        "$mainMod, 0, workspace, 10" # switch to workspace 10
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}

