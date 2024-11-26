{
  plugins = {
    lsp = {
      enable = true;


      # Enable LSP servers
      servers = {
        # GraphQL LSP configuration
        graphql = {
          enable = true;
          filetypes = [ "graphql" "gql" "svelte" "typescriptreact" "javascriptreact" ];
        };

        # Emmet LSP configuration
        emmet_ls = {
          enable = true;
          filetypes = [
            "html"
            "typescriptreact"
            "javascriptreact"
            "css"
            "sass"
            "scss"
            "less"
            "svelte"
          ];
        };

        # ESLint configuration
        eslint = {
          enable = true;
          filetypes = [ "javascript" "javascriptreact" "typescript" "typescriptreact" "svelte" ];
          settings.eslint = {
            validate = [ "javascript" "javascriptreact" "typescript" "typescriptreact" "svelte" ];
            run = "onType";
          };
        };

        # Clangd configuration
        clangd = {
          enable = true;
          filetypes = [ "c" "cpp" "objc" "objcpp" "cuda" "proto" ];
        };

        # Lua LSP configuration
        lua_ls = {
          enable = true;
          settings.Lua = {
            diagnostics.globals = [ "vim" ];
            completion.callSnippet = "Replace";
          };
        };
      };

      # Configure keymaps
      onAttach = {
        function = true;
        mappings = [
          {
            mode = "n";
            key = "gR";
            action = "<cmd>Telescope lsp_references<CR>";
            options = {
              desc = "Show LSP references";
              silent = true;
            };
          }
          {
            mode = "n";
            key = "gD";
            action = "vim.lsp.buf.declaration";
            lua = true;
            options = {
              desc = "Go to declaration";
              silent = true;
            };
          }
          {
            mode = "n";
            key = "gd";
            action = "<cmd>Telescope lsp_definitions<CR>";
            options = {
              desc = "Show LSP definitions";
              silent = true;
            };
          }
          {
            mode = "n";
            key = "gi";
            action = "<cmd>Telescope lsp_implementations<CR>";
            options = {
              desc = "Show LSP implementations";
              silent = true;
            };
          }
          {
            mode = "n";
            key = "gt";
            action = "<cmd>Telescope lsp_type_definitions<CR>";
            options = {
              desc = "Show LSP type definitions";
              silent = true;
            };
          }
          {
            mode = [ "n" "v" ];
            key = "<leader>ca";
            action = "vim.lsp.buf.code_action";
            lua = true;
            options = {
              desc = "See available code actions";
              silent = true;
            };
          }
          {
            mode = "n";
            key = "<leader>rn";
            action = "vim.lsp.buf.rename";
            lua = true;
            options = {
              desc = "Smart rename";
              silent = true;
            };
          }
          {
            mode = "n";
            key = "<leader>D";
            action = "<cmd>Telescope diagnostics bufnr=0<CR>";
            options = {
              desc = "Show buffer diagnostics";
              silent = true;
            };
          }
          {
            mode = "n";
            key = "<leader>d";
            action = "vim.diagnostic.open_float";
            lua = true;
            options = {
              desc = "Show line diagnostics";
              silent = true;
            };
          }
          {
            mode = "n";
            key = "[d";
            action = "vim.diagnostic.goto_prev";
            lua = true;
            options = {
              desc = "Go to previous diagnostic";
              silent = true;
            };
          }
          {
            mode = "n";
            key = "]d";
            action = "vim.diagnostic.goto_next";
            lua = true;
            options = {
              desc = "Go to next diagnostic";
              silent = true;
            };
          }
          {
            mode = "n";
            key = "K";
            action = "vim.lsp.buf.hover";
            lua = true;
            options = {
              desc = "Show documentation for what is under cursor";
              silent = true;
            };
          }
          {
            mode = "n";
            key = "<leader>rs";
            action = ":LspRestart<CR>";
            options = {
              desc = "Restart LSP";
              silent = true;
            };
          }
        ];
      };
    };

    # Enable dependencies
    cmp-nvim-lsp.enable = true;
    nvim-lsp-file-operations = {
      enable = true;
      autoConfig = true;
    };
    neodev.enable = true;
  };

  # Configure diagnostic signs
  diagnostics = {
    signs = {
      text = {
        Error = " ";
        Warn = " ";
        Hint = "󰠠 ";
        Info = " ";
      };
    };
  };
}
