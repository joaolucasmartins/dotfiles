
#!/bin/sh

# A dwm_bar function that shows the current date and time
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Date is formatted like like this: "[Mon 01-01-00 00:00:00]"
dwm_update() {
	out_path="/dev/shm/bar/0-update"
	sudo pacs > /dev/null
	wait
	is_update=$(pacman -Qu | wc -w)
	echo "$1"
	if [ $is_update != 0 ]
	then
		is_update=$((is_update/4))
		printf "$is_update 🗘" > $out_path
		sudo -u jm DISPLAY:=0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send --expire-time=10000 "🗘 Updates Available!"
	else
		rm $out_path
	fi
}

dwm_update $1
