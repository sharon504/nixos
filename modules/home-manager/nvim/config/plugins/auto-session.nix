{
  plugins.auto-session = {
    enable = true;
    settings = {
      auto_restore_enabled = false;
    };
    # Main configuration options
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
