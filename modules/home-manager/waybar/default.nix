{
  home.file = {
  ".config/waybar/" = ./waybar; 
  };

  programs.waybar = {
    enable = true;
    style = builtins.readFile ./waybar/style.css;
    };
  };
}
