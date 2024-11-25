{ pkgs, ... }:
{
  plugins.lazygit = {
    enable = true;

    # Commands that will lazy-load the plugin
    cmd = [
      "LazyGit"
      "LazyGitConfig"
      "LazyGitCurrentFile"
      "LazyGitFilter"
      "LazyGitFilterCurrentFile"
    ];

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
