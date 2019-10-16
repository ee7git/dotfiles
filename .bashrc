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

# Dotfile
alias dotfile='/usr/bin/git --git-dir=${HOME}/.dotfiles/ --work-tree=${HOME}'

# DuckDNS
alias duckdns-update='cd ${HOME} && ./.duckdns.sh'

# Git
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gst='git status'

# Docker
alias dcls='docker container ls -a'
alias dcrm='docker container rm -f'
alias dcrun='docker container run'
alias dils='docker image ls -a'
alias dirm='docker image rm -f'
alias dtest='docker build -t test . && docker container run -p 80:3000 -it --name testy test'
alias dtestrm='docker container rm -f testy && docker image rm -f test'

alias astng_ohaio='ssh -i "/home/warren/.ssh/astng.pem" ubuntu@ec2-18-219-244-226.us-east-2.compute.amazonaws.com'
alias astng_brazil='ssh -i "/home/warren/.ssh/astng_brazil.pem" ubuntu@ec2-18-231-188-3.sa-east-1.compute.amazonaws.com'

PS1='[\u@\h \W]\$ '

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
