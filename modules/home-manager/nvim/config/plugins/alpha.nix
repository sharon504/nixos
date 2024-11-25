{
  plugins.alpha = {
    enable = true;
    theme = "dashboard";
    iconsEnabled = true;
    layout = [
      {
        type = "padding";
        val = 1;
      }
      {
        type = "text";
        opts = {
          position = "center";
          hl = "Type";
          val = [
            "                                                               "
            "   █████╗ ██╗     ██████╗ ██╗  ██╗ █████╗ ███████╗ ██████╗ ██╗  ██╗"
            "  ██╔══██╗██║     ██╔══██╗██║  ██║██╔══██╗██╔════╝██╔═══██╗██║  ██║"
            "  ███████║██║     ██████╔╝███████║███████║███████╗██║   ██║███████║"
            "  ██╔══██║██║     ██╔═══╝ ██╔══██║██╔══██║╚════██║██║   ██║╚════██║"
            "  ██║  ██║███████╗██║     ██║  ██║██║  ██║███████║╚██████╔╝     ██║"
            "  ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝ ╚═════╝      ╚═╝"
            "                                                               "
          ];
        };
      }
      {
        type = "padding";
        val = 2;
      }
      {
        type = "group";
        val = [
          {
            command = "<cmd>ene<CR>";
            desc = "  > New File";
            shortcut = "e";
          }
          {
            command = "<cmd>NvimTreeToggle<CR>";
            desc = "  > Toggle file explorer";
            shortcut = "SPC ee";
          }
          {
            command = "<cmd>Telescope find_files<CR>";
            desc = "󰱼  > Find File";
            shortcut = "SPC ff";
          }
          {
            command = "<cmd>Telescope live_grep<CR>";
            desc = "  > Find Word";
            shortcut = "SPC fs";
          }
          {
            command = "<cmd>SessionRestore<CR>";
            desc = "󰁯  > Restore Session For Current Directory";
            shortcut = "SPC wr";
          }
          {
            command = "<cmd>qa<CR>";
            desc = "  > Quit NVIM";
            shortcut = "q";
          }
        ];
      }
      {
        type = "padding";
        val = 2;
      }
    ];

    # Disable folding on alpha buffer
    extraOptions = {
      nofoldenable = true;
    };
  };
}
