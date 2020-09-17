#!/bin/sh

# A dwm_bar function to display information regarding system memory, CPU temperature, and storage
# Joe Standring <git@joestandring.com>
# GNU GPLv3

dwm_resources () {
    IDENTIFIER="unicode"
    out_path="/dev/shm/bar/1-resources"
    # Used and total memory
    MEMUSED="" #$(free -h | awk '(NR == 2) {print $3}')
    MEMTOT="" # $(free -h |awk '(NR == 2) {print $2}')
    # CPU temperature
    CPU=$(acpi -t | cut --characters=16,17,18,19,29 -z)
    # Used and total storage in /home (rounded to 1024B)
    STOUSED=""  # $(df -h | grep '/home$' | awk '{print $3}')
    STOTOT=""  # $(df -h | grep '/home$' | awk '{print $2}')
    STOPER="" # $(df -h | grep '/home$' | awk '{print $5}')

    # printf "%s" "$SEP1" > $out_path
    if [ "$IDENTIFIER" = "unicode" ]; then
        printf "💻 %s%s%s%s%s%s " "$MEMUSED" "$MEMTOT" "$CPU" "$STOUSED" "$STOTOT" "$STOPER" > $out_path
    else
        printf "STA | MEM %s/%s CPU:%s STO%s%s:%s " "$MEMUSED" "$MEMTOT" "$CPU" "$STOUSED" "$STOTOT" "$STOPER" > $out_path
    fi
    # printf "%s\n" "$SEP2"
}

dwm_resources
