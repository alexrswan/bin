#!/bin/bash


# Import the colors
. "${HOME}/.cache/wal/colors.sh"

get_battery() {
	charge_now=$(cat /sys/class/power_supply/BAT0/energy_now)
	charge_full_design=$(cat /sys/class/power_supply/BAT0/energy_full_design)
	echo $(( $charge_now * 100 / $charge_full_design ))%
}

get_date() {
	date
}

display_info() {
	while true; do
		printf "%s$D %s$D%s\n" \
		  "$(get_battery)" \
		  "$(get_date)"
		sleep 1
	done
	}

display_info | lemonbar -bp -B "$color0" -F "$color8"
