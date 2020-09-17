#!/bin/sh

# A dwm_bar function to display the number of emails in an inbox
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# To count mail in an inbox, change "/path/to/inbox" below to the location of your inbox. For example, "/home/$USER/.mail/new"

dwm_mail () {
    out_path="/dev/shm/bar/3-mail"
    MAILBOX=$(find /home/jm/.local/share/mail/*/*/new -type f | wc -l)

    # printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        if [ "$MAILBOX" -eq 0 ]; then
            printf "📪 %s " "$MAILBOX" > $out_path
        else
            printf "📫 %s " "$MAILBOX" > $out_path
        fi
    else
        printf "MAI %s" "$MAILBOX" > $out_path
    fi
    # printf "%s\n" "$SEP2"
}

dwm_mail
