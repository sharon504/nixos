{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    terminal = "screen-256color";
    baseIndex = 1;
    clock24 = true;
    escapeTime = 0;
    mouse = true;
    keyMode = "vi";
    shell = null;

    extraConfig = ''
      ##### Basic Setup #####
      set -g prefix C-a
      unbind C-b
      bind C-a send-prefix

      # Pane bindings
      unbind %
      bind \\ split-window -h
      unbind '"'
      bind - split-window -v

      # Reload config
      unbind r
      bind r source-file ~/.config/tmux/tmux.conf

      # Pane resize
      bind -r j resize-pane -D 5
      bind -r k resize-pane -U 5
      bind -r l resize-pane -R 5
      bind -r h resize-pane -L 5
      bind -r m resize-pane -Z

      # Copy mode with vi keys
      bind-key -T copy-mode-vi 'v' send -X begin-selection
      bind-key -T copy-mode-vi 'y' send -X copy-selection
      unbind -T copy-mode-vi MouseDragEnd1Pane

      # Status bar positioning
      set -g status-position top

      ##### Fix for window name changing #####
      # Disable rename globally and per-window
      set -g allow-rename off
      set -g automatic-rename off
      setw -g automatic-rename off

      ##### Optional: Override status line window format (debug/test mode) #####
      set -g window-status-format "#I:#W"
      # set -g window-status-current-format "#I:#W"

      ##### tmux-resurrect and continuum options #####
      set -g @resurrect-capture-pane-contents 'on'
      set -g @continuum-restore 'on'
    '';

    plugins = with pkgs.tmuxPlugins; [
      sensible
      vim-tmux-navigator
      battery
      resurrect
      {
        plugin = catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavour 'mocha'
          set -g @catppuccin_window_status_style "basic"

          # Make sure Catppuccin shows window names (#W), not commands
          set -g @catppuccin_window_default_text "#W"
          set -g @catppuccin_window_current_text "#W"

          # Optional: display status segments
          set -g status-right "#{E:@catppuccin_status_application} #{E:@catppuccin_status_gitmux} #{E:@catppuccin_status_user}"
        '';
      }
    ];
  };
}
