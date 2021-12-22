#!/bin/bash
# Upload external functions
	checkfile=/home/ed/scripts/external_func.sh
	[[ ! -f $checkfile ]] && echo -e "File $(basename -- "$checkfile") does not exist. Press any key to continue." && read -rsn1 && exit 5 || source $checkfile;
# Clean the package cache
function packagecache() {
	# ( echo "y"; echo "y"; echo "y" ) | yay -Scc
	yay -Scc --noconfirm
	exitcode=$?
	exitcontrol
}
# Send notification
function notifynownow() {
	iconerr=/home/ed/.local/share/icons/status/dialog-warning.svg
	iconst=/home/ed/.local/share/icons/status/trophy-gold.svg

	echo "$codedescription | $(date) | Exit code = $exitcode | Package cache has cleaned." \
	>> $HOME/.local/share/log-files/pac_cache.log

	case $exitcode in
	 0)	notify-send -u normal -t 3000 'Package cache has cleaned' 'Result: SUCCESS' -i $iconst && exit 0 ;;
	 *)	notify-send -u critical -t 3000 'Clean the Package Cache' 'Result: ERROR' -i $iconerr && exit 1 ;;
	esac
}
#
packagecache
notifynownow
