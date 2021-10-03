#!/bin/bash

# Ensure PID file is removed on program exit.
mypidfile=/tmp/recording.sh.pid
trap "rm -f $mypidfile; polybar-msg hook record 1; jobs -p | xargs kill; exit 0" EXIT
run_pid=$$

# Returns 0 if no instance of recorder is running.
# Returns pid of running recording proc if otherwise.
function startup () {
    if [ -f "$mypidfile" ]; then
        # "Already running"
        echo $(cat "$mypidfile")
    else
        # Create a file with current PID to indicate that process is running.
        echo $$ > "$mypidfile"
        # Signal polybar
        echo 0
    fi
}

# TODO polybar integration
ret=$(startup)
if [ $ret -eq 0 ]; then
    format=$(printf "audio\nvideo\n" | dmenu)
    output=$(printf "" | dmenu -p "Filename")

    # if [ $format == "video" ]; then
    if [ -z "$format" ] || [ -z "$output" ]; then
        exit 0
    elif [ $format == "audio" ]; then
        output="$output.mp3"
    else
        output="$output.mp4"
    fi
    polybar-msg hook record 2 > /dev/null

    if [ -f "$output" ]; then # File exists
        confirm=$(printf "yes\nno\n" | dmenu -p "Overwrite $output?")
    else
        confirm="yes"
    fi

    if [ -z "$confirm" ] || [ $confirm == "no" ]; then
        exit 0
    fi

    echo Recording with pid "$$"

    if [ $format == "video" ]; then
        ffmpeg -y -nostdin -f x11grab -video_size 1920x1080 -framerate 25 -i $DISPLAY -f pulse -i default -c:v libx264 -preset ultrafast -c:a aac $output
        echo "?????"
    elif [ $format == "audio" ]; then
        ffmpeg -y -nostdin -f pulse -i default $output
        echo "?????"
    fi
    exit 0

else
    #run_pid=$(cat "$mypidfile")
    stop=$(printf "yes\nno\n" | dmenu -p "Stop recording?")
    echo $stop
    if [ -z "$stop" ] || [ $stop == "no" ]; then
        echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
        exit 0
    else
        echo "Killing " $ret
        polybar-msg hook record 1 > /dev/null
        rm -f $mypidfile
        kill $ret; exit 0
    fi
fi
