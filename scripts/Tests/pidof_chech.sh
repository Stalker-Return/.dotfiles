#!/bin/bash

run_check () {
[ -z "$(pidof ping)" ] || RUNCHECK=1
}

run_check
while [ $RUNCHECK -eq 1 ]; do
	notify-send --urgency=critical --expire-time=1400 "Don't turn off your compiter. Updating in progress."
	run_check && read -t 2
	done

exit
