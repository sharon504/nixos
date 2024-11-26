{
  config.opts = {
    # Basic settings
    relativenumber = true;
    number = true;

    # Tabs & indentation
    tabstop = 2; # 2 spaces for tabs (prettier default)
    shiftwidth = 2; # 2 spaces for indent width
    expandtab = true; # expand tab to spaces
    autoindent = true; # copy indent from current line when starting new one
    wrap = false;

    # Search settings
    ignorecase = true; # ignore case when searching
    smartcase = true; # if you include mixed case in your search, assumes you want case-sensitive
    cursorline = true;

    # Colors and UI
    termguicolors = true; # turn on termguicolors for colorscheme support
    background = "dark"; # colorschemes that can be light or dark will be made dark
    signcolumn = "yes"; # show sign column so that text doesn't shift

    # Backspace behavior
    backspace = "indent,eol,start"; # allow backspace on indent, end of line or insert mode start position

    # Clipboard settings
    clipboard = "unnamedplus"; # use system clipboard as default register

    # Split windows
    splitright = true; # split vertical window to the right
    splitbelow = true; # split horizontal window to the bottom

    # Disable swapfile
    swapfile = false;

  };
}
