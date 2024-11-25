{
  plugins.lint = {
    enable = true;

    # Events for lazy loading

    # Linter configuration
    linters_by_ft = {
      javascript = [ "eslint_d" ];
      typescript = [ "eslint_d" ];
      javascriptreact = [ "eslint_d" ];
      typescriptreact = [ "eslint_d" ];
      svelte = [ "eslint_d" ];
      python = [ "pylint" ];
    };
  };

  # Autocommands for automatic linting
  autoCmd = [
    {
      event = [ "BufEnter" "BufWritePost" "InsertLeave" ];
      group = "lint"; # This will automatically create the group
      callback = {
        __raw = ''
          function()
            require('lint').try_lint()
          end
        '';
      };
    }
  ];

  # Keymaps
  keymaps = [
    {
      mode = "n";
      key = "<leader>l";
      action = {
        __raw = ''
          function()
            require('lint').try_lint()
          end
        '';
      };
      options = {
        desc = "Trigger linting for current file";
      };
    }
  ];
}
