# set up command history
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=5000
unsetopt beep

# set up autocompletion
autoload -Uz compinit
compinit

zstyle ":completion:*" menu select
zstyle ':completion::complete:*' gain-privileges 1

# set up alias' 
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias sudo="sudo "
alias neofetch="fastfetch"
alias vim="nvim"

# set up prompt
PS1="[%F{green}%n%f%F{yellow}@%f%F{red}%m%f %1~]$ "

# on zsh startup
# --------------
fastfetch
