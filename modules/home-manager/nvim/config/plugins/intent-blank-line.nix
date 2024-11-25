{ pkgs, ... }:
{
  plugins.comment-nvim = {
    enable = true;
    # Setting up pre-load events
    event = [ "BufReadPre" "BufNewFile" ];

    # Adding dependency
    extraPlugins = [ pkgs.vimPlugins.nvim-ts-context-commentstring ];

    # Configuration
    config = {
      pre_hook = "require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()";
    };
  };
}
