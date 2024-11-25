{ pkgs, ... }:
{
  plugins.lazygit = {
    enable = true;
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
