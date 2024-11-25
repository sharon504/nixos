{
  plugins = {
    todo-comments = {
      enable = true;
      event = [ "BufReadPre" "BufNewFile" ];
    };
  };

  # Keymaps for todo-comments navigation
  keymaps = [
    {
      mode = "n";
      key = "]t";
      action = "require('todo-comments').jump_next";
      lua = true;
      options = {
        desc = "Next todo comment";
      };
    }
    {
      mode = "n";
      key = "[t";
      action = "require('todo-comments').jump_prev";
      lua = true;
      options = {
        desc = "Previous todo comment";
      };
    }
  ];
}
