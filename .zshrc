export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="xiong-chiamiov-plus"


DISABLE_UNTRACKED_FILES_DIRTY="true"

zstyle ':autocomplete:*' fzf-completion no

plugins=(fzf zsh-autocomplete)

source $ZSH/oh-my-zsh.sh

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

WORDCHARS='*?[]~&;!#$%^(){}<>'
autoload -U select-word-style
select-word-style bash
bindkey '^[[1;5C' emacs-forward-word
bindkey '^[[1;5D' emacs-backward-word
bindkey "\e[3~" delete-char
bindkey "\e[H"  beginning-of-line
bindkey "\e[F"  end-of-line
bindkey "\e\d"  undo
bindkey '^R' history-incremental-search-backward

export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.zsh_history

alias ll="ls -alF"
alias vi="nvim"
alias vim="nvim"

export PATH="$PATH"
