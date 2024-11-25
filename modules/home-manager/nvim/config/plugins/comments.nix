{
  plugins = {
    # Enable and configure Comment.nvim
    comment = {
      enable = true;

      # Pre-hook configuration for JSX/TSX support
      mappings.pre_hook = "require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()";
    };

    # Enable required treesitter context commentstring plugin
    ts-context-commentstring = {
      enable = true;
    };
  };

  # Add required event configuration for lazy loading
  extraConfigLua = ''
    vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
      callback = function()
        require("Comment")
      end
    })
  '';
}
