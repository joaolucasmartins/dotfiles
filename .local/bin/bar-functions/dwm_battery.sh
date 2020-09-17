#!/bin/sh

# A dwm_bar function to read the battery level and status
# Joe Standring <git@joestandring.com>
# GNU GPLv3

dwm_battery () {
    out_path="/dev/shm/bar/2-battery"
    # Change BAT1 to whatever your battery is identified as. Typically BAT0 or BAT1
    CHARGE=$(cat /sys/class/power_supply/BAT1/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT1/status)
    IDENTIFIER="unicode"
    
		    #sudo -u jm DISPLAY:=0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send --urgency=critical --expire-time=60000 "$STATUS"
    # printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        if [ "$STATUS" = "Unknown" ] || [ "$STATUS" = "Charging" ]; then
            printf "🔌 %s%%%s " "$CHARGE" > $out_path
        else
            printf "🔋 %s%%%s " "$CHARGE" > $out_path
	    if [ "$CHARGE" -lt 15 ]; then
		    echo ha!
		    sudo -u jm DISPLAY:=0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send --urgency=critical --expire-time=60000 "Battery level low!!! Plug AC"
	    fi
        fi
    else
        printf "BAT %s%% %s" "$CHARGE" > $out_path
    fi
    # printf "%s\n" "$SEP2"
}

dwm_battery

