#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Alais
alias c="clear"
alias ls="exa -al --color=always --group-directories-first"
alias n="nvim"
alias pip="python -m pip"
alias config='/usr/bin/git --git-dir=/home/raccoon/.dotfiles/ --work-tree=/home/raccoon'

neofetch
PS1="[\u@\h \W]\$ "

bind 'set completion-ignore-case on'
