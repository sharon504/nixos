{
  plugins.lint = {
    enable = true;

    # Equivalent to event = { "BufReadPre", "BufNewFile" }
    extraOptions = {
      event = [ "BufReadPre" "BufNewFile" ];
    };

    lintersByFt = {
      javascript = [ "eslint_d" ];
      typescript = [ "eslint_d" ];
      javascriptreact = [ "eslint_d" ];
      typescriptreact = [ "eslint_d" ];
      svelte = [ "eslint_d" ];
      python = [ "pylint" ];
    };
  };
}
