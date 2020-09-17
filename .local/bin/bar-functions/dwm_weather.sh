#!/bin/sh

# A dwm_bar function to print the weather from wttr.in
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: curl

# Change the value of LOCATION to match your city
dwm_weather() {
    LOCATION=Porto,Portugal
    out_path="/dev/shm/bar/6-weather"
    # printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        printf "%s" "$(curl -s wttr.in/$LOCATION?format=1)" > $out_path
    else
        printf "WEA %s" "$(curl -s wttr.in/$LOCATION?format=1 | grep -o "[0-9].*")" > $out_path
    fi
    # printf "%s\n" "$SEP2"
}

dwm_weather
