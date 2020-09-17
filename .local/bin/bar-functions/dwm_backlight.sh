#!/bin/sh

# A dwm_bar module to display the current backlight brighness with xbacklight
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: xbacklight

dwm_backlight () {
    out_path="/dev/shm/bar/4-backlight"
    printf "%s☀ %.0f%s \n" "$SEP1" "$(light -s "sysfs/backlight/acpi_video1") "$SEP2"" > $out_path
}

dwm_backlight
