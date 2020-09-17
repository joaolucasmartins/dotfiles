#!/bin/sh

# A dwm_bar function to show the master volume of ALSA
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: alsa-utils

dwm_alsa () {
    out_path="/dev/shm/bar/5-alsa"
    export IDENTIFIER="unicode"
    VOL=$(amixer get Master | tail -n1 | sed -r "s/.*\[(.*)%\].*/\1/")
    # printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        if [ $VOL -eq 0 ]; then
            printf "🔇 " > $out_path
        elif [ "$VOL" -gt 0 ] && [ "$VOL" -le 33 ]; then
            printf "🔈 %s%% " "$VOL" > $out_path
        elif [ "$VOL" -gt 33 ] && [ "$VOL" -le 66 ]; then
            printf "🔉 %s%% " "$VOL" > $out_path
        else
            printf "🔊 %s%% " "$VOL" > $out_path
        fi
    else
        if [ "$VOL" -eq 0 ]; then
            printf "MUTE"
        elif [ "$VOL" -gt 0 ] && [ "$VOL" -le 33 ]; then
            printf "VOL %s%%" "$VOL" > $out_path
        elif [ "$VOL" -gt 33 ] && [ "$VOL" -le 66 ]; then
            printf "VOL %s%%" "$VOL" > $out_path
        else
            printf "VOL %s%%" "$VOL" > $out_path
        fi
    fi
    # printf "%s\n" "$SEP2"
}

dwm_alsa
