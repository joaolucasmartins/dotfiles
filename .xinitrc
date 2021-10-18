xrdb ~/.Xresources

polybar config &
wal -R &
picom --experimental-backends --config ~/.config/picom.conf &
dunst &
xset led 3 # Light keyboard
exec xmonad
