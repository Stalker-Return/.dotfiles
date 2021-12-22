#!/bin/bash
# Check db.lck
	checkfile=/var/lib/pacman/db.lck
	[[ -f $checkfile ]] && sudo rm /var/lib/pacman/db.lck || echo -e "db.lck doesn't exist";
# Upload external functions
	checkfile=/home/ed/scripts/external_func.sh
	[[ ! -f $checkfile ]] && echo -e "File $(basename -- "$checkfile") does not exist. Press any key to continue." && read -rsn1 && exit 5 || source $checkfile;
# Full system update
function updatenow() {
	sudo pacman -Syu --noconfirm --logfile $HOME/.local/share/log-files/sys_pacman.log
	exitcode=$?
	exitcontrol
}
# Send notification
function notifynownow() {
	iconerr=/home/ed/.local/share/icons/status/dialog-warning.svg
	iconst=/home/ed/.local/share/icons/status/trophy-gold.svg

	echo "$codedescription | $(date) | Exit code = $exitcode | Full System Update has completed." \
	>> $HOME/.local/share/log-files/sys_update.log

	case $exitcode in
	 0)	notify-send -u normal -t 3000 'Full System Update' 'Result: SUCCESS' -i $iconst && exit 0 ;;
	 *)	notify-send -u critical -t 3000 'Full System Update' 'Result: ERROR' -i $iconerr && exit 1 ;;
	esac
}
#
updatenow
notifynownow
