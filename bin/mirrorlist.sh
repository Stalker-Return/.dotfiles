#!/bin/bash
# Upload external functions
	checkfile=/home/ed/scripts/external_func.sh
	[[ ! -f $checkfile ]] && echo -e "File $(basename -- "$checkfile") does not exist. Press any key to continue." && read -rsn1 && exit 5 || source $checkfile;
# Mirror List update
function newmirror() {
	sudo reflector -f 10 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist
	#sudo reflector -c Slovakia -a 6 --sort rate --save /etc/pacman.d/mirrorlist
	exitcode=$?
	exitcontrol
}
# Send notification
function notifynownow() {
	iconerr=/home/ed/.local/share/icons/status/dialog-warning.svg
	iconst=/home/ed/.local/share/icons/status/trophy-gold.svg

	echo "$codedescription | $(date) | Exit code = $exitcode | Mirror List has updated." \
	>> $HOME/.local/share/log-files/mirrorlist.log

	case $exitcode in
	 0)	notify-send -u normal -t 3000 'Mirror List Update' 'Result: SUCCESS' -i $iconst && exit 0 ;;
	 *)	notify-send -u critical -t 3000 'Mirror List Update' 'Result: ERROR' -i $iconerr && exit 1 ;;
	esac
}
#
newmirror
notifynownow
