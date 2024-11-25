{
  plugins.supermaven-nvim = {
    enable = true;

    settings = {
      keymaps = {
        accept_suggestion = "<Tab>";
        clear_suggestion = "<C-]>";
        accept_word = "<C-j>";
      };

      ignore_filetypes = {
        cpp = true;
      };

      color = {
        suggestion_color = "#ffffff";
        cterm = 244;
      };

      log_level = "info";
      disable_inline_completion = false;
      disable_keymaps = false;
    };
  };
}
