#!/bin/bash
# Upload external functions
checkfile=/home/ed/scripts/external_func.sh
[[ -e $checkfile ]] && source $checkfile || exist 3;
# Delete cache
function updatenow() {
	rm -rf ~/.cache/*
	exitcode=$?
	exitcontrol
}
# Send notification
function notifynownow() {
	iconerr=/home/ed/.local/share/icons/status/dialog-warning.svg
	iconst=/home/ed/.local/share/icons/status/trophy-gold.svg

	echo "$codedescription | $(date) | Exit code = $exitcode | Cache in the home directory has cleaned." \
	>> $HOME/.local/share/log-files/del_cache.log

	case $exitcode in
	 0)	notify-send -u normal -t 3000 'Clean the cache: SUCCESS' -i $iconst && exit 0 ;;
	 *)	notify-send -u critical -t 3000 'Clean the cache' 'Result: ERROR' -i $iconerr && exit 1 ;;
	esac
}
#
updatenow
notifynownow
