{ config, pkgs, ... }:
{
  home.file = {
    ".config/zsh/aliasrc" = { 
      source = ./aliasrc; 
    };
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    plugins = [
        {
          name = "powerlevel10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
    ];
    initExtra = builtins.readFile ./zshrc;
  };

  home.sessionVariables = {
    WAL_SKIP = "kitty";
    HISTSIZE = "10000";
    SAVEHIST = "10000";
    HISTFILE = "${config.home.homeDirectory}/.cache/zshhistory";
    BAT_THEME = "Monokai Extended Origin";
    FZF_DEFAULT_COMMAND = "fd -H --strip-cwd-prefix -E '.git'";
    FZF_CTRL_T_COMMAND = "fd -H --strip-cwd-prefix -E '.git'";
    FZF_ALT_C_COMMAND = "fd --type=d -H --strip-cwd-prefix -E '.git'";
    PATH = "${config.home.homeDirectory}/.cargo/bin:$PATH";
  };

  home.sessionPath = [
    "${config.home.homeDirectory}/.cargo/bin"
  ];
}

