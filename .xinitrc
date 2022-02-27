#!/bin/sh
xrdb ~/.Xresources

xrandr --output HDMI-0 --mode 1280x1024
xrandr --output DVI-I-1 --mode 1920x1080 --rate 144
xrandr --output HDMI-0 --left-of DVI-I-1
polybar config &
#MONITOR=HDMI-0 polybar config &

setxkbmap -layout pt

dunst &
xset led 3 # Light keyboard
picom --experimental-backends --config ~/.config/picom.conf &
wal -R &

exec xmonad
