{
  programs.nixvim = {
    # Telescope plugin configuration
    plugins.telescope = {
      enable = true;

      # Use attribute sets for extensions
      extensions = {
        plenary.enable = true;
        fzf.enable = true;
        todo-comments.enable = true;
        fzf-native.enable = true;
        web-devicons.enable = true;
      };

      # Basic telescope configuration
      defaults = {
        pathDisplay = [ "smart" ];
        mappings = {
          i = {
            "<C-k>" = "move_selection_previous";
            "<C-j>" = "move_selection_next";
            "<C-q>" = {
              action = ''
                function()
                  local actions = require("telescope.actions")
                  local trouble = require("trouble")
                  actions.send_selected_to_qflist()
                  trouble.toggle("quickfix")
                end
              '';
              lua = true;
            };
            "<C-t>" = {
              action = ''
                function()
                  require("trouble.sources.telescope").open()
                end
              '';
              lua = true;
            };
          };
        };
      };
    };

    # Keymaps configuration
    keymaps = [
      {
        mode = "n";
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<cr>";
        options = {
          desc = "Fuzzy find files in cwd";
        };
      }
      {
        mode = "n";
        key = "<leader>fr";
        action = "<cmd>Telescope oldfiles<cr>";
        options = {
          desc = "Fuzzy find recent files";
        };
      }
      {
        mode = "n";
        key = "<leader>fs";
        action = "<cmd>Telescope live_grep<cr>";
        options = {
          desc = "Find string in cwd";
        };
      }
      {
        mode = "n";
        key = "<leader>fc";
        action = "<cmd>Telescope grep_string<cr>";
        options = {
          desc = "Find string under cursor in cwd";
        };
      }
      {
        mode = "n";
        key = "<leader>ft";
        action = "<cmd>TodoTelescope<cr>";
        options = {
          desc = "Find todos";
        };
      }
    ];
  };
}
