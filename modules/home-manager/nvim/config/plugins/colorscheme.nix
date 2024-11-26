{
  colorschemes.tokyonight = {
    settings = {
      style = "night";
      light_style = "day";
      transparent = true;
      terminal_colors = true;

      styles = {
        comments = { italic = true; };
        keywords = { italic = true; };
        functions = { };
        variables = { };

        sidebars = "dark";
        floats = "dark";
      };

      sidebars = [ "qf" "help" ];
      floats = [ "lsp" "notify" "diff" "telescope" ];

      dim_inactive = true;
      lualine_bold = false;
      lsp_trouble = false;

      modules = [
        "which-key"
        "indent-blankline"
        "bufferline"
        "cmp"
        "nvim-cmp"
        "gitsigns"
        "telescope"
      ];
    };
  };
}
