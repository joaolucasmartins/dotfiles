#!/bin/bash
declare -a images
declare -i n=0
IFS=$'\r\n' GLOBIGNORE='*' command eval 'images=($(ls /home/jm/Images/Wallpapers)'
n=${#images[@]}
FILE=${images[$((RANDOM % $n))]}

wal -i /home/jm/Images/Wallpapers/$FILE -q
wal_dunst
# sudo build_dwm &
sudo build_dmenu &
bspc wm -r &
wait
# killall dwm
