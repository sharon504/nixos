{ pkgs, config, ... }:
{
  plugins = {
    nvim-tree = {
      enable = true;


      # Disable netrw
      disableNetrw = true;

      # View configuration
      view = {
        width = 35;
        relativenumber = true;
      };

      # Renderer configuration
      renderer = {
        indentMarkers.enable = true;
        icons = {
          glyphs = {
            folder = {
              arrowClosed = ""; # arrow when folder is closed
              arrowOpen = ""; # arrow when folder is open
            };
          };
        };
      };

      # Actions configuration
      actions = {
        openFile = {
          quitOnOpen = false;
          resizeWindow = true;
        };
        windowPicker = {
          enable = true;
        };
      };

      # Filters configuration
      filters = {
        custom = [ ".DS_Store" ];
      };

      diagnostics = {
        enable = true;
      };

      # Git configuration
      git = {
        enable = true;
        ignore = true;
      };
    };
  };

  # Keymaps
  keymaps = [
    {
      mode = "n";
      key = "<leader>ee";
      action = "<cmd>NvimTreeToggle<CR>";
      options = {
        desc = "Toggle file explorer";
      };
    }
    {
      mode = "n";
      key = "<leader>ef";
      action = "<cmd>NvimTreeFindFileToggle<CR>";
      options = {
        desc = "Toggle file explorer on current file";
      };
    }
    {
      mode = "n";
      key = "<leader>ec";
      action = "<cmd>NvimTreeCollapse<CR>";
      options = {
        desc = "Collapse file explorer";
      };
    }
    {
      mode = "n";
      key = "<leader>er";
      action = "<cmd>NvimTreeRefresh<CR>";
      options = {
        desc = "Refresh file explorer";
      };
    }
  ];
}
