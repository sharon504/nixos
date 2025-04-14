{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = builtins.readFile ./aliasrc;

    initExtra = builtins.readfile ./zshrc;
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

