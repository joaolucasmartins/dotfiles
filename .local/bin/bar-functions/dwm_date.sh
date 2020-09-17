#!/bin/sh

# A dwm_bar function that shows the current date and time
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Date is formatted like like this: "[Mon 01-01-00 00:00:00]"

dwm_date () {
    out_path="/dev/shm/bar/7-date"
    export IDENTIFIER="unicode"
    # printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
	    printf "📆 %s" "$(date "+%a %d-%m-%y %H:%M")" > $out_path
    else
	    printf "DAT %s" "$(date "+%a %d-%m-%y %T")" > $out_path
    fi
    # printf "%s\n" "$SEP2"
}

dwm_date
