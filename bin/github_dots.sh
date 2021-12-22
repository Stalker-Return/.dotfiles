#!/bin/sh
# Upload external functions
checkfile=/home/ed/scripts/external_func.sh
[[ ! -f $checkfile ]] && echo -e "File $(basename -- "$checkfile") does not exist. Press any key to continue." && read -rsn1 && exit 5 || source $checkfile;
#
# Update GIT-folder
function githubupdate() {
# GIT ADD
summctrl=0
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME add \
.bashrc .fehbg .xscreensaver README.md .Xresources scripts/ bin/ Templates/ \
.local/share/icons/ .local/share/log-files/ .local/share/wallpapers/ .local/share/applications/ \
.config/mimeapps.list \
.config/geany/ .config/gtk-3.0/ .config/lxterminal/ .config/libreoffice/ .config/pulse/ \
.config/systemd/ .config/tint2/ .config/openbox/ .config/pcmanfm/ .config/dunst/ \
.config/FreeFileSync/ .config/conky/ .config/i3/ .config/doublecmd/
exitcode=$?
exitcontrol
exitcode1=$exitcode
summctrl=$(expr $summctrl + $exitcode1)
# GIT COMMIT
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME commit -m "Dayly upload"
exitcode=$?
exitcontrol
exitcode2=$exitcode
summctrl=$(expr $summctrl + $exitcode2)
# GIT PUSH
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME push -u
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
	
	echo "$codedescription | $(date) | Exit codes:$exitcode1:$exitcode2:$exitcode3 | Github .dotfiles has updated." \
	>> $HOME/.local/share/log-files/github_dots.log

	case $summctrl in
	 0)	notify-send -u normal -t 3000 'GIT .dotfiles Full Update' 'Result: SUCCESS' -i $iconst && exit 0 ;;
	 *)	notify-send -u critical -t 3000 'GIT .dotfiles Full Update' 'Result: ERROR' -i $iconerr && exit 1 ;;
	esac
}
githubupdate
notifynownow
