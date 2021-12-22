#!/bin/bash
# Upload external functions
checkfile=/home/ed/scripts/external_func.sh
[[ ! -f $checkfile ]] && echo -e "File $(basename -- "$checkfile") does not exist. Press any key to continue." && read -rsn1 && exit 5 || source $checkfile;
### Check if command is running
function run_check() {
	[ -z "$(pidof pacman)" ] && RUNCHECK=0 || RUNCHECK=1
	[ -z "$(pidof yay)" ] && RUNCHECK=0 || RUNCHECK=1
}
### Notify if YES
function warnme() {
	notify-send --urgency=critical --expire-time=1600 "Don't turn off your compiter" "Fucking Sysytem update in progress"
}
### Notification
function notification(){
	run_check
	while true; do
	 case $RUNCHECK in
		1)	warnme && run_check && read -t 2;;
		0)	exit;;
	 esac
	done
}

notification
