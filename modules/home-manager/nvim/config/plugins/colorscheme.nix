{
  # Enable and configure colorscheme
  colorscheme = "tokyonight";
  plugins.tokyonight = {
    style = "night"; # The theme comes in three styles, `storm`, `moon`, and `night`
    lightStyle = "day"; # The theme is used when the background is set to light
    transparent = true; # Enable this to disable setting the background color
    terminalColors = true; # Configure the colors used when opening a `:terminal` in Neovim

    # Style configurations
    styles = {
      comments = {
        italic = true;
      };
      keywords = {
        italic = true;
      };
      functions = { };
      variables = { };

      # Background styles. Can be "dark", "transparent" or "normal"
      sidebars = "dark"; # style for sidebars
      floats = "dark"; # style for floating windows
    };

    # Sidebar and float configurations
    sidebars = [
      "qf"
      "help"
    ];

    floats = [
      "lsp"
      "notify"
      "diff"
      "telescope"
    ];

    # Other options
    dimInactive = true; # dim inactive splits
    lualineBold = false; # bold the lualine theme
    lspTrouble = false; # enable the lsp-trouble plugin

    # Modules to apply theme to
    modules = {
      "which-key" = true;
      "indent-blankline" = true;
      "bufferline" = true;
      "cmp" = true;
      "nvim-cmp" = true;
      "gitsigns" = true;
      "telescope" = true;
    };
  };
}
