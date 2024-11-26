{
  plugins.conform-nvim = {
    enable = true;

    # Formatter configurations by file type
    formattersByFt = {
      javascript = [ "prettier" ];
      typescript = [ "prettier" ];
      javascriptreact = [ "prettier" ];
      typescriptreact = [ "prettier" ];
      svelte = [ "prettier" ];
      css = [ "prettier" ];
      html = [ "prettier" ];
      json = [ "prettier" ];
      yaml = [ "prettier" ];
      markdown = [ "prettier" ];
      graphql = [ "prettier" ];
      liquid = [ "prettier" ];
      lua = [ "stylua" ];
      python = [ "isort" "black" ];
    };

  };

  # Keymaps for manual formatting
  keymaps = [
    {
      mode = [ "n" "v" ];
      key = "<leader>mp";
      action = ''
        function()
          require("conform").format({
            lsp_fallback = true,
            async = false,
            timeout_ms = 1000,
          })
        end
      '';
      options = {
        desc = "Format file or range (in visual mode)";
      };
    }
  ];

  # Add event configuration for lazy loading
  extraConfigLua = ''
    vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
      callback = function()
        require("conform")
      end
    })
  '';
}
