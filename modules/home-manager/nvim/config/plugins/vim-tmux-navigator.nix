{
  plugins.tmux-navigator = {
    enable = true;

    # Commands for lazy loading (Note: NixVim might handle this automatically)
    commands = [
      "TmuxNavigateLeft"
      "TmuxNavigateDown"
      "TmuxNavigateUp"
      "TmuxNavigateRight"
      "TmuxNavigatePrevious"
    ];
  };

  # Configure keymaps for navigation
  keymaps = [
    {
      mode = "n";
      key = "<c-h>";
      action = "<cmd><C-U>TmuxNavigateLeft<cr>";
    }
    {
      mode = "n";
      key = "<c-j>";
      action = "<cmd><C-U>TmuxNavigateDown<cr>";
    }
    {
      mode = "n";
      key = "<c-k>";
      action = "<cmd><C-U>TmuxNavigateUp<cr>";
    }
    {
      mode = "n";
      key = "<c-l>";
      action = "<cmd><C-U>TmuxNavigateRight<cr>";
    }
    {
      mode = "n";
      key = "<c-\\>";
      action = "<cmd><C-U>TmuxNavigatePrevious<cr>";
    }
  ];
}
