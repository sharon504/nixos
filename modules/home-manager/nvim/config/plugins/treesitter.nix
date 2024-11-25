{
  plugins = {
    treesitter = {
      enable = true;

      # Event-based loading (Note: NixVim might handle this differently)
      loadOnEvent = [
        "BufReadPre"
        "BufNewFile"
      ];

      # Enable autotagging plugin
      moduleConfig = {
        autotag = {
          enable = true;
        };
      };

      # Enable syntax highlighting
      highlight = {
        enable = true;
      };

      # Enable indentation
      indent = {
        enable = true;
      };

      # Configure incremental selection
      incrementalSelection = {
        enable = true;
        keymaps = {
          initSelection = "<C-space>";
          nodeIncremental = "<C-space>";
          scopeIncremental = false;
          nodeDecremental = "<bs>";
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

    # Enable nvim-ts-autotag plugin
    ts-autotag = {
      enable = true;
    };
  };
}
