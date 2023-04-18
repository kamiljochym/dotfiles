#!/bin/bash

run_rofi() {
	echo -e "Settings\nSleep\nRestart\nShutdown" | rofi -dmenu -i -p " "
}



confirm_exit() {
	echo -e "Yes\nNo" | rofi -dmenu -i -p "Are you sure?"
}

run_cmd() {

	selected=$(confirm_exit)
	echo "$selected $1"
	if [[ $selected == "Yes" ]]; then
		case $1 in
			--sleep)
				systemctl suspend
				;;
			--restart)
				reboot
				;;
			--shutdown)
				shutdown
				;;
		esac
	else
		exit 0
	fi
}

var=$(run_rofi)
case ${var} in
	Settings)
		gnome-control-center
		;;
	Sleep)
		run_cmd --sleep
		;;

	Restart)
		run_cmd --restart
		;;
	
	Shutdown)
		run_cmd --shutdown
		;;
esac




