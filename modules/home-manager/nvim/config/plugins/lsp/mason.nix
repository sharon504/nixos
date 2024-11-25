{
  plugins.mason = {
    enable = true;
    ui = {
      icons = {
        package_installed = "✓";
        package_pending = "➜";
        package_uninstalled = "✗";
      };
    };
  };

  plugins.mason-lspconfig = {
    enable = true;
    ensureInstalled = [
      "tsserver"
      "html"
      "cssls"
      "tailwindcss"
      "svelte"
      "lua_ls"
      "graphql"
      "emmet_ls"
      "prismals"
      "pyright"
    ];
  };

  plugins.mason-tool-installer = {
    enable = true;
    ensureInstalled = [
      "prettier"
      "stylua"
      "isort"
      "black"
      "pylint"
      "eslint"
    ];
  };
}
