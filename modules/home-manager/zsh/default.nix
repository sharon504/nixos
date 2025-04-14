{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = builtins.readFile ./aliasrc;

    initExtra = ''
      # Powerlevel10k instant prompt
      if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
        source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
      fi

      export WAL_SKIP="kitty"
      export EDITOR=vim
      export HISTSIZE=10000
      export SAVEHIST=10000
      export HISTFILE=~/.cache/zshhistory
      setopt appendhistory

      autoload -U compinit
      zstyle ':completion:*' menu select
      zmodload zsh/complist
      compinit
      _comp_options+=(globdots)

      bindkey '^ ' autosuggest-accept
      bindkey '' backward-delete-word

      [ -f "$HOME/.config/zsh/aliasrc" ] && source "$HOME/.config/zsh/aliasrc"
      eval "$(direnv hook zsh)"

      source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
      source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
      source /usr/share/zsh/plugins/autojump/autojump.zsh 2>/dev/null
      source ~/powerlevel10k/powerlevel10k.zsh-theme
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

      eval "$(/home/alpha/.local/bin/mise activate zsh)"
      eval "$(mise activate zsh)"
      eval "$(ssh-agent -s)" >/dev/null
      eval "$(fzf --zsh)"

      export FZF_DEFAULT_COMMAND="fd -H --strip-cwd-prefix -E '.git'"
      export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
      export FZF_ALT_C_COMMAND="fd --type=d -H --strip-cwd-prefix -E '.git'"

      _fzf_compgen_path() {
        fd -H -E '.git' . "$1"
      }

      _fzf_compgen_dir() {
        fd --type=d -H -E '.git' . "$1"
      }

      source ~/git-modules/fzf-git.sh/fzf-git.sh

      export BAT_THEME='Monokai Extended Origin'
      show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"
      export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
      export FZF_ALT_C_OPTS="--preview 'exa --tree --color=always {} | head -200'"

      _fzf_comprun() {
        local command=$1
        shift

        case "$command" in
          cd)           fzf --preview 'exa --tree --color=always {} | head -200' "$@" ;;
          export|unset) fzf --preview "eval 'echo \${}'" "$@" ;;
          ssh)          fzf --preview 'dig {}' "$@" ;;
          *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
        esac
      }

      eval "$(zoxide init zsh)"
      . "$HOME/.cargo/env"
    '';
  };

  home.sessionVariables = {
    EDITOR = "vim";
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

