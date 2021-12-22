#!/bin/bash
# Upload external functions
	checkfile=/home/ed/scripts/external_func.sh
	[[ ! -f $checkfile ]] && echo -e "File $(basename -- "$checkfile") does not exist. Press any key to continue." && read -rsn1 && exit 5 || source $checkfile;
# Clean the jornal
function cleanjornal() {
	sudo journalctl --vacuum-time=2weeks
	exitcode=$?
	exitcontrol
}
#
# Send notification
function notifynownow() {
	iconerr=/home/ed/.local/share/icons/status/dialog-warning.svg
	iconst=/home/ed/.local/share/icons/status/trophy-gold.svg

	echo "$codedescription | $(date) | Exit code = $exitcode | Journal directory has cleaned." \
	>> $HOME/.local/share/log-files/clean_journal.log

	case $exitcode in
	 0)	notify-send -u normal -t 3000 'Journal directory has cleaned' 'Result: SUCCESS' -i $iconst && exit 0 ;;
	 *)	notify-send -u critical -t 3000 'Journal directory has cleaned' 'Result: ERROR' -i $iconerr && exit 1 ;;
	esac
}
#
cleanjornal
notifynownow
