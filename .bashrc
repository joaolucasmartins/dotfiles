#
# ~/.bashrc test
#

# If not running interactively, don't do anything
export PATH="$PATH:$HOME/.local/bin"
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias bime='nvim'
PS1='[\u@\h \W]\$ '
