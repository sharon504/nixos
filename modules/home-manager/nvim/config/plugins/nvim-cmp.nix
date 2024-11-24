{
  plugins = {
    nvim-cmp = {
      enable = true;

      event = [ "InsertEnter" ];

      # Dependencies
      extraPlugins = with pkgs.vimPlugins; [
        cmp-buffer
        cmp-path
        luasnip
        cmp_luasnip
        friendly-snippets
        lspkind-nvim
      ];

      snippet.expand = ''
        function(args)
          require('luasnip').lsp_expand(args.body)
        end
      '';

      completion = {
        completeopt = "menu,menuone,preview,noselect";
      };

      mapping = {
        "<C-k>" = "cmp.mapping.select_prev_item()";
        "<C-j>" = "cmp.mapping.select_next_item()";
        "<C-b>" = "cmp.mapping.scroll_docs(-4)";
        "<C-f>" = "cmp.mapping.scroll_docs(4)";
        "<C-Space>" = "cmp.mapping.complete()";
        "<C-e>" = "cmp.mapping.abort()";
        "<CR>" = "cmp.mapping.confirm({ select = false })";
      };

      sources = [
        { name = "nvim_lsp"; }
        { name = "luasnip"; }
        { name = "buffer"; }
        { name = "path"; }
      ];

      experimental = {
        ghost_text = true;
      };

      formatting = {
        format = ''
          require('lspkind').cmp_format({
            maxwidth = 50,
            ellipsis_char = "..."
          })
        '';
      };
    };
  };

  # Load VSCode-style snippets
  extraConfigLua = ''
    require('luasnip.loaders.from_vscode').lazy_load()
  '';
}
