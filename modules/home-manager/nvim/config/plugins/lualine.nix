{ pkgs, ... }:
{
  plugins.lualine = {
    enable = true;

    # Theme configuration
    theme = {
      normal = {
        a = {
          bg = "#65D1FF";
          fg = "#112638";
          gui = "bold";
        };
        b = {
          bg = "#112638";
          fg = "#c3ccdc";
        };
        c = {
          bg = "#112638";
          fg = "#c3ccdc";
        };
      };

      insert = {
        a = {
          bg = "#3EFFDC";
          fg = "#112638";
          gui = "bold";
        };
        b = {
          bg = "#112638";
          fg = "#c3ccdc";
        };
        c = {
          bg = "#112638";
          fg = "#c3ccdc";
        };
      };

      visual = {
        a = {
          bg = "#FF61EF";
          fg = "#112638";
          gui = "bold";
        };
        b = {
          bg = "#112638";
          fg = "#c3ccdc";
        };
        c = {
          bg = "#112638";
          fg = "#c3ccdc";
        };
      };

      command = {
        a = {
          bg = "#FFDA7B";
          fg = "#112638";
          gui = "bold";
        };
        b = {
          bg = "#112638";
          fg = "#c3ccdc";
        };
        c = {
          bg = "#112638";
          fg = "#c3ccdc";
        };
      };

      replace = {
        a = {
          bg = "#FF4A4A";
          fg = "#112638";
          gui = "bold";
        };
        b = {
          bg = "#112638";
          fg = "#c3ccdc";
        };
        c = {
          bg = "#112638";
          fg = "#c3ccdc";
        };
      };

      inactive = {
        a = {
          bg = "#2c3043";
          fg = "#c3ccdc";
          gui = "bold";
        };
        b = {
          bg = "#2c3043";
          fg = "#c3ccdc";
        };
        c = {
          bg = "#2c3043";
          fg = "#c3ccdc";
        };
      };
    };

    # Sections configuration
    sections = {
      lualine_x = [
        {
          name = "lazy_status.updates";
          # In Nixvim, you might need to configure this differently
          # Depends on how Nixvim handles lazy status updates
          extraConfig = {
            cond = "require('lazy.status').has_updates";
            color = { fg = "#ff9e64"; };
          };
        }
        "encoding"
        "fileformat"
        "filetype"
      ];
    };
  };

  # Optional: Ensure nvim-web-devicons is installed
  plugins.web-devicons.enable = true;
}
