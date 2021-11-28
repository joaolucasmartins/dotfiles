#
# ~/.bashrc test
#

# If not running interactively, don't do anything
export PATH="$PATH:$HOME/.local/bin"
export LD_LIBRARY_PATH=/usr/local/lib

export _JAVA_AWT_WM_NONREPARENTING=1
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias bime='nvim'
PS1='[\u@\h \W]\$ '
