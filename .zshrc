export PATH="$HOME/.local/bin:$PATH"

# set up command history
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt APPEND_HISTORY

unsetopt beep

# set up autocompletion
autoload -Uz compinit && compinit

zstyle ":completion:*" menu select
zstyle ':completion::complete:*' gain-privileges 1

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# fzf bind
bindkey '^T' fzf-file-widget

# set up alias' 
alias cp="cp -i"
alias rm="rm -i"
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias sudo="sudo "
alias neofetch="fastfetch"
alias vim="nvim"
alias y="yazi"

# set up prompt
PS1="[%F{green}%n%f%F{yellow}@%f%F{red}%m%f %1~]$ "
