{
  plugins.auto-session = {
    enable = true;

    # Main configuration options
    settingsOptions = {
      auto_restore = false;
    };
  };

  # Keymaps for auto-session
  keymaps = [
    {
      mode = "n";
      key = "<leader>wr";
      action = "<cmd>SessionRestore<CR>";
      options.desc = "Restore session for cwd";
    }
    {
      mode = "n";
      key = "<leader>ws";
      action = "<cmd>SessionSave<CR>";
      options.desc = "Save session for auto session root dir";
    }
  ];
}
