#!/bin/sh

# A dwm_bar function to show the current network connection/SSID, private IP, and public IP
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: NetworkManager, curl

dwm_network () {
    out_path="/dev/shm/bar/6-mail"
    if [ $1 -eq 1 ]; then
	    printf "🌐 " > $out_path
	    sudo -u jm DISPLAY:=0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send --expire-time=3000 "🌐 Access to Internet"
    else
	    rm $out_path
	    sudo -u jm DISPLAY:=0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send --expire-time=3000 "🌐 No access to Internet"
    fi

    # printf "%s\n" "$SEP2" 
}

dwm_network $1
