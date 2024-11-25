{ pkgs, ... }:
{
  plugins = {
    lualine = {
      enable = true;

      # Add dependency
      extraPlugins = [ pkgs.vimPlugins.nvim-web-devicons ];

      # Theme configuration
      theme = {
        normal = {
          a = { bg = "#65D1FF"; fg = "#112638"; gui = "bold"; };
          b = { bg = "#112638"; fg = "#c3ccdc"; };
          c = { bg = "#112638"; fg = "#c3ccdc"; };
        };
        insert = {
          a = { bg = "#3EFFDC"; fg = "#112638"; gui = "bold"; };
          b = { bg = "#112638"; fg = "#c3ccdc"; };
          c = { bg = "#112638"; fg = "#c3ccdc"; };
        };
        visual = {
          a = { bg = "#FF61EF"; fg = "#112638"; gui = "bold"; };
          b = { bg = "#112638"; fg = "#c3ccdc"; };
          c = { bg = "#112638"; fg = "#c3ccdc"; };
        };
        command = {
          a = { bg = "#FFDA7B"; fg = "#112638"; gui = "bold"; };
          b = { bg = "#112638"; fg = "#c3ccdc"; };
          c = { bg = "#112638"; fg = "#c3ccdc"; };
        };
        replace = {
          a = { bg = "#FF4A4A"; fg = "#112638"; gui = "bold"; };
          b = { bg = "#112638"; fg = "#c3ccdc"; };
          c = { bg = "#112638"; fg = "#c3ccdc"; };
        };
        inactive = {
          a = { bg = "#2c3043"; fg = "#semilightgray"; gui = "bold"; };
          b = { bg = "#2c3043"; fg = "#semilightgray"; };
          c = { bg = "#2c3043"; fg = "#semilightgray"; };
        };
      };

      # Sections configuration
      sections = {
        lualine_x =
          {
            # Lazy status updates
            {
            __raw = ''
              {
                require('lazy.status').updates,
                cond = require('lazy.status').has_updates,
                color = { fg = "#ff9e64" },
              }
            '';
          }
            # Standard components
            { name = "encoding"; }
            { name = "fileformat"; }
            { name = "filetype"; }
          };
      };
    };
  };
}
