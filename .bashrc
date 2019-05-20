#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias l='ls -l'
alias ll='ls -la'
alias cc='clear'
alias rr='reset'
alias dotfile='/usr/bin/git --git-dir=${HOME}/.dotfiles/ --work-tree=${HOME}'
alias duckdns-update='cd ${HOME} && ./.duckdns.sh'

PS1='[\u@\h \W]\$ '
