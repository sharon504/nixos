{ pkgs, ... }:
{
  plugins.lazygit = {
    enable = true;

    # Add dependency
    extraPlugins = [ pkgs.vimPlugins.plenary-nvim ];
  };

  # Keymaps
  keymaps = [
    {
      mode = "n";
      key = "<leader>lg";
      action = "<cmd>LazyGit<cr>";
      options = {
        desc = "Open lazy git";
      };
    }
  ];
}
