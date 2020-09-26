#!/bin/bash
declare -a images
declare -i n=0
IFS=$'\r\n' GLOBIGNORE='*' command eval 'images=($(ls /home/jm/Images/Wallpapers)'
n=${#images[@]}
FILE=${images[$((RANDOM % $n))]}

wal -i /home/jm/Images/wallpapers/$FILE -q
wal_dunst
# sudo build_dwm &
sudo /home/jm/.local/bin/build/build_dmenu &
sudo /home/jm/.local/bin/build/build_st &
xmonad --recompile
wait
xmonad --restart
# killall dwm
