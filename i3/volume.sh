#!/bin/bash

# You can call this script like this:
# $./volume.sh up
# $./volume.sh down
# $./volume.sh mute

pkill -SIGUSR1 herbe
function get_volume {
    amixer get Master | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1
}

function is_mute {
    amixer get Master | grep '%' | grep -oE '[^ ]+$' | grep off > /dev/null
}

function send_notification {
    volume=`get_volume`
    # Make the bar with the special character ─ (it's not dash -)
    # https://en.wikipedia.org/wiki/Box-drawing_character
    bar=$(seq -s "─" $(($volume / 3)) | sed 's/[0-9]//g')
    mute=`is_mute`
    if is_mute ; then
        herbe "    $bar $volume Muted"

    else
    # Send the notification
        herbe "    $bar $volume"
    fi


}

send_notification
# case $1 in
#     up)
# 	# Set the volume on (if it was muted)
# 	amixer -D pulse set Master on > /dev/null
# 	# Up the volume (+ 5%)
# 	amixer -D pulse sset Master 5%+ > /dev/null
# 	send_notification
# 	;;
#     down)
# 	amixer -D pulse set Master on > /dev/null
# 	amixer -D pulse sset Master 5%- > /dev/null
# 	send_notification
# 	;;
#     mute)
#     	# Toggle mute
# 	amixer -D pulse set Master 1+ toggle > /dev/null
# 	if is_mute ; then
# 	    dunstify -i audio-volume-muted -t 8 -r 2593 -u normal "Mute"
# 	else
# 	    send_notification
# 	fi
# 	;;
# esac
