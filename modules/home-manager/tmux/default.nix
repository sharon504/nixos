{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;

    # Basic settings
    terminal = "screen-256color";
    baseIndex = 1;
    clock24 = true;
    escapeTime = 0;
    mouse = true;
    keyMode = "vi";
    shell = null;

    extraConfig = ''
      set -g prefix C-a
      unbind C-b
      bind C-a send-prefix

      unbind %
      bind \\ split-window -h

      unbind '"'
      bind - split-window -v

      unbind r
      bind r source-file ~/.config/tmux/tmux.conf

      bind -r j resize-pane -D 5
      bind -r k resize-pane -U 5
      bind -r l resize-pane -R 5
      bind -r h resize-pane -L 5
      bind -r m resize-pane -Z

      setw -g pane-base-index 1

      bind-key -T copy-mode-vi 'v' send -X begin-selection
      bind-key -T copy-mode-vi 'y' send -X copy-selection
      unbind -T copy-mode-vi MouseDragEnd1Pane

      set -g status-position top
      set -g @resurrect-capture-pane-contents 'on'
      set -g @continuum-restore 'on'
    '';

    plugins = with pkgs.tmuxPlugins; [
      tpm
      sensible
      vim-tmux-navigator
      tmux-battery
      tmux-resurrect
      # For Catppuccin, if not in `pkgs.tmuxPlugins`, add as a custom plugin
    ];

    pluginManager = "tpm";

    extraPlugins = [
      {
        plugin = "catppuccin/tmux";
        settings = {
          catppuccin_flavour = "mocha";
          catppuccin_status_left = "session user";
          catppuccin_status_right = "directory battery date_time";
        };
      }
    ];

    # Set plugin options
  };
}
