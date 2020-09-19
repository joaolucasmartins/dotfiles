#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# export HISTCONTROL=ignoreboth:erasedups  #ignore spaces and erase duplicates from bash history
# export HISTSIZE=-1  #infinite list size
# export HISTFILESIZE=-1  #infinite file size

export GOBIN=/home/jm/Apps/go/bin
export GOPATH=/home/jm/Apps/go
export PATH=$PATH:$GOBIN

# Java compatbility with dwm
export _JAVA_AWT_WM_NONREPARENTING=1
export EDITOR=nvim
export VISUAL=nvim

# Base16 Shell
#BASE16_SHELL="$HOME/.config/base16-shell/"
#[ -n "$PS1" ] && \
#    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#        eval "$("$BASE16_SHELL/profile_helper.sh")"
