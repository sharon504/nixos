{
  home.file.".config/waybar" = { source = ./waybar; };
  programs.waybar = {
    enable = true;
    style = builtins.readFile ./waybar/style.css;
  };
}
