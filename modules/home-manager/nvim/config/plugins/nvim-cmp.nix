{ pkgs, ... }:
{
  plugins = {
    cmp-buffer.enable = true;
    cmp-path.enable = true;
    cmp_luasnip.enable = true;
    cmp-nvim-lsp.enable = true;
    friendly-snippets.enable = true;
    lspkind.enable = true;
    nvim-cmp = {
      enable = true;

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
