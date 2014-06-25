#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Used with pass
source /usr/share/bash-completion/completions/pass

# Create pre & post BTRFS snapshots with snapper
alias pacmanSyu='snp pacman -Syu'
