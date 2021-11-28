#!/bin/fish
alias bime=nvim
alias ls="ls --group-directories-first --color=auto"
alias l="colorls -Al --sd -t"

set FEUP "~/Nextcloud/FEUP"
set 3oAno "$FEUP/3ºAno"
set 3A_1S "$3oAno/3oAno1oSemestre"

alias LTWa="cd $3A_1S/LTW/Assets"
alias LTWc="cd $3A_1S/LTW/Classes"
alias LTWw="cd $3A_1S/LTW/Work"
alias LAIGa="cd $3A_1S/LAIG/Assets"
alias LAIGc="cd $3A_1S/LAIG/Classes"
alias LAIGw="cd $3A_1S/LAIG/Work"
alias PLOGa="cd $3A_1S/PLOG/Assets"
alias PLOGc="cd $3A_1S/PLOG/Classes"
alias PLOGw="cd $3A_1S/PLOG/Work"
alias RCOMa="cd $3A_1S/RCOM/Assets"
alias RCOMc="cd $3A_1S/RCOM/Classes"
alias RCOMw="cd $3A_1S/RCOM/Work"
alias ESOFa="cd $3A_1S/ESOF/Assets"
alias ESOFc="cd $3A_1S/ESOF/Classes"
alias ESOFw="cd $3A_1S/ESOF/Work"

set 4oAno "$FEUP/4ºAno"
set 4A_1S "$4oAno/4oAno1oSemestre"
alias PRI="cd $4A_1S/PRI"
alias SDLE="cd $4A_1S/SDLE"
alias FSI="cd $4A_1S/FSI"
alias AC="cd $4A_1S/AC"
alias DS="cd $4A_1S/DS"

# Typo
alias   cd..="cd .."
alias   ...="cd ../.."
alias   cd...="cd ../.."

# Safety
alias   cp="cp -i"
alias   ln="ln -i"
alias   mv="mv -i"
alias   rm="rm -I"
alias   chown="chown --preserve-root"
alias   chmod="chmod --preserve-root"
alias   chgrp="chgrp --preserve-root"

alias   clndep='sudo pacman -R (pacman -Qdtq)'
alias   clnrep="printf 'Cleaning uninstalled packages\n'; sudo paccache -ruk0; printf 'Leaving last version of installed packages\n'; sudo paccache -rk1"
