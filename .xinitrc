xrdb ~/.Xresources

polybar config &
wal -R &
picom --experimental-backends --config ~/.config/picom.conf &
dunst &
exec xmonad
