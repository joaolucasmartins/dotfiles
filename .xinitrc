xrdb ~/.Xresources

xautolock -time 1 -locker slock &
wal -R
polybar config &
picom --config .config/picom.conf &
exec xmonad
