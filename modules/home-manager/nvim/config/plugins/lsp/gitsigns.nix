{
  plugins.gitsigns = {
    enable = true;

    # Event-based loading (Note: NixVim might handle this differently)
    loadOnEvent = [
      "BufReadPre"
      "BufNewFile"
    ];

    # Keymaps configuration using NixVim's format
    onAttach = {
      function = true;
      # Navigation
      mappings = [
        {
          mode = "n";
          key = "]h";
          action = "require('gitsigns').next_hunk";
          lua = true;
          options.desc = "Next Hunk";
        }
        {
          mode = "n";
          key = "[h";
          action = "require('gitsigns').prev_hunk";
          lua = true;
          options.desc = "Prev Hunk";
        }
        # Actions
        {
          mode = "n";
          key = "<leader>hs";
          action = "require('gitsigns').stage_hunk";
          lua = true;
          options.desc = "Stage hunk";
        }
        {
          mode = "n";
          key = "<leader>hr";
          action = "require('gitsigns').reset_hunk";
          lua = true;
          options.desc = "Reset hunk";
        }
        {
          mode = "v";
          key = "<leader>hs";
          action = "function() require('gitsigns').stage_hunk({vim.fn.line('.'), vim.fn.line('v')}) end";
          lua = true;
          options.desc = "Stage hunk";
        }
        {
          mode = "v";
          key = "<leader>hr";
          action = "function() require('gitsigns').reset_hunk({vim.fn.line('.'), vim.fn.line('v')}) end";
          lua = true;
          options.desc = "Reset hunk";
        }
        {
          mode = "n";
          key = "<leader>hS";
          action = "require('gitsigns').stage_buffer";
          lua = true;
          options.desc = "Stage buffer";
        }
        {
          mode = "n";
          key = "<leader>hR";
          action = "require('gitsigns').reset_buffer";
          lua = true;
          options.desc = "Reset buffer";
        }
        {
          mode = "n";
          key = "<leader>hu";
          action = "require('gitsigns').undo_stage_hunk";
          lua = true;
          options.desc = "Undo stage hunk";
        }
        {
          mode = "n";
          key = "<leader>hp";
          action = "require('gitsigns').preview_hunk";
          lua = true;
          options.desc = "Preview hunk";
        }
        {
          mode = "n";
          key = "<leader>hb";
          action = "function() require('gitsigns').blame_line({ full = true }) end";
          lua = true;
          options.desc = "Blame line";
        }
        {
          mode = "n";
          key = "<leader>hB";
          action = "require('gitsigns').toggle_current_line_blame";
          lua = true;
          options.desc = "Toggle line blame";
        }
        {
          mode = "n";
          key = "<leader>hd";
          action = "require('gitsigns').diffthis";
          lua = true;
          options.desc = "Diff this";
        }
        {
          mode = "n";
          key = "<leader>hD";
          action = "function() require('gitsigns').diffthis('~') end";
          lua = true;
          options.desc = "Diff this ~";
        }
        # Text object
        {
          mode = [ "o" "x" ];
          key = "ih";
          action = ":<C-U>Gitsigns select_hunk<CR>";
          options.desc = "Gitsigns select hunk";
        }
      ];
    };
  }
