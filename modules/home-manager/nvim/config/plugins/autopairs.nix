{
  plugins = {
    # Enable and configure nvim-autopairs
    nvim-autopairs = {
      enable = true;

      # Configure main options

      # TreeSitter configuration
      settings = {
        check_ts = true; # enable treesitter
        ts_config = {
          lua = [ "string" ]; # don't add pairs in lua string treesitter nodes
          javascript = [ "template_string" ]; # don't add pairs in javascript template_string treesitter nodes
          java = false; # don't check treesitter on java
        };
      };
    };

    # Enable nvim-cmp for integration
    nvim-cmp = {
      enable = true;

      # Configure autopairs integration
      experimental = {
        ghost_text = false;
      };

      # Add the autopairs mapping
      mapping = {
        "<CR>" = "cmp.mapping.confirm({ select = true })";
      };
    };
  };

  # Extra options
  extraConfigLua = ''
    local cmp = require('cmp')
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
  '';
}
