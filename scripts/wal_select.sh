#!/bin/bash

DIR=$HOME/Images/Wallpapers/

if [ "$1" == "" ] || [ $# -gt 1 ]; then
	declare -a images
	declare -i n=0
	IFS=$'\r\n' GLOBIGNORE='*' command eval 'images=($(ls $DIR))'
	n=${#images[@]}
	FILE=${images[$((RANDOM % $n))]}
	echo "Selected wallpaper $FILE"
else
	if [ "$1" == "-l" ]; then
		ls $DIR
		exit 0
	else
		FILE=$1
	fi
fi


if wal -i $DIR/$FILE -q; then
	wal_dunst
	# sudo build_dwm &
	sudo /home/jm/.local/bin/build/build_dmenu &
	# sudo /home/jm/.local/bin/build/build_st &
	xmonad --recompile
	wait
	xmonad --restart
	# killall dwm
else
	echo "Invalid wallpaper $DIR$FILE"
	exit 1
fi
