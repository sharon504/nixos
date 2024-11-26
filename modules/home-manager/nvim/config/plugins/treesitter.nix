{
  plugins = {
    treesitter = {
      enable = true;
      settings = {
        # Syntax highlighting
        highlight.enable = true;

        # Indentation
        indent.enable = true;

        # Incremental selection with corrected keymaps
        incrementalSelection = {
          enable = true;
          keymaps = {
            initSelection = {
              action = "<C-space>";
            };
            nodeIncremental = {
              action = "<C-space>";
            };
            scopeIncremental = {
              action = false;
            };
            nodeDecremental = {
              action = "<bs>";
            };
          };
        };

        # Ensure these language parsers are installed
        ensureInstalled = [
          "json"
          "javascript"
          "typescript"
          "tsx"
          "yaml"
          "html"
          "css"
          "prisma"
          "markdown"
          "markdown_inline"
          "svelte"
          "graphql"
          "bash"
          "lua"
          "vim"
          "dockerfile"
          "gitignore"
          "query"
          "vimdoc"
          "c"
        ];
      };
    };

    # Enable nvim-ts-autotag plugin
    ts-autotag.enable = true;
  };
}
