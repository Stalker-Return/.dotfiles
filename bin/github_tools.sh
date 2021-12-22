#!/bin/sh
# Upload external functions
checkfile=/home/ed/scripts/external_func.sh
[[ ! -f $checkfile ]] && echo -e "File $(basename -- "$checkfile") does not exist. Press any key to continue." && read -rsn1 && exit 5 || source $checkfile;
#
# Update GIT-folder
function githubupdate() {
# GIT ADD
summctrl=0
/usr/bin/git --git-dir=$HOME/.git/tools/ --work-tree=$HOME/Clouds/Dropbox/BackUps/Linux/ add .
exitcode=$?
exitcontrol
exitcode1=$exitcode
summctrl=$(expr $summctrl + $exitcode1)
# GIT COMMIT
/usr/bin/git --git-dir=$HOME/.git/tools/ --work-tree=$HOME/Clouds/Dropbox/BackUps/Linux/ commit -m "Regular Update"
exitcode=$?
exitcontrol
exitcode2=$exitcode
summctrl=$(expr $summctrl + $exitcode2)
# GIT PUSH
/usr/bin/git --git-dir=$HOME/.git/tools/ --work-tree=$HOME/Clouds/Dropbox/BackUps/Linux/ push -u
exitcode=$?
exitcontrol
exitcode3=$exitcode
summctrl=$(expr $summctrl + $exitcode3)
}
#
# Send notification
function notifynownow() {
	iconerr=/home/ed/.local/share/icons/status/dialog-warning.svg
	iconst=/home/ed/.local/share/icons/status/trophy-gold.svg
	
	[[ "$summctrl" -eq 0 ]] && codedescription="Success" || codedescription="Error  "

	echo "$codedescription | $(date) | Exit codes:$exitcode1:$exitcode2:$exitcode3 | Github tools has updated." \
	>> $HOME/.local/share/log-files/github_tools.log

	case $summctrl in
	 0)	notify-send -u normal -t 3000 'GIT-Tools Full Update' 'Result: SUCCESS' -i $iconst && exit 0 ;;
	 *)	notify-send -u critical -t 3000 'GIT-Tools Full Update' 'Result: ERROR' -i $iconerr && exit 1 ;;
	esac
}
githubupdate
notifynownow
