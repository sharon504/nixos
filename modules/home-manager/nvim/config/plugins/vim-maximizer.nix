{
  plugins.vim-maximizer.enable = true;

  keymaps = [
    {
      mode = "n";
      key = "<leader>sm";
      action = "<cmd>MaximizerToggle<CR>";
      options = {
        desc = "Maximize/minimize a split";
      };
    }
  ];
}
