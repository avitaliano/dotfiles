# -*- mode: sh -*-

# ls
alias ls='ls --color=auto --group-directories-first -X'
alias l='ls -lhrt'
alias ll='ls -lh'
alias la='l -A'
alias lk='k -A --no-vcs'
alias ld='lk -d'
alias lf='lk -n'

# quick alias
alias c='clear'
alias q='exit'
alias b='builtin cd ..'

alias w='echo -e "$Cyan ${"$(pwd)"/$HOME/~} ${Red}at ${Cyan}$(whoami)${Red}@${Yellow}$(hostname -s)$Red \
using $Yellow${0}$Purple ${DOT_PROMPT_CHAR:-$}${Rst}"'

# apps
alias ag='ag --hidden'

alias tarc='tar -zcvf file.tar.gz'
alias tarx='tar -zxvf'

# zsh config
alias re='exec zsh'
alias dot='la $(find ~ -maxdepth 1 -type l)'

# dotfiles
alias r='~/.dotfiles/install.zsh'
alias t='tmux new-session -A -s tmux -n shell'

# dirs
alias d=show_and_choose
alias 1='cd +1'
