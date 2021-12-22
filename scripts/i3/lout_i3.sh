#! /bin/bash
# A simple script to make system logout easier
# dependansies: zenity, pidof
#
# Menu Images
shutdownicon="/home/ed/.local/share/icons/apps/system-shutdown.svg"
rebooticon="/home/ed/.local/share/icons/apps/system-reboot.svg"
suspendicon="/home/ed/.local/share/icons/apps/system-suspend.svg"
hibernateicon="/home/ed/.local/share/icons/apps/system-suspend-hibernate.svg"
logouticon="/home/ed/.local/share/icons/apps/system-log-out.svg"
#
# Check if pacman is running
function run_check() {
	[ -z "$(pidof pacman)" ] || RUNCHECK=1
	[ -z "$(pidof yay)" ] || RUNCHECK=1
	[ -z "$(pidof paru)" ] || RUNCHECK=1
}
# Notification
function notification() {
	zenity --warning --text="Your shit system update is in a fucking progress, bro" --no-wrap
	exit 5
}
# Logout Menu
function i3logout() {
	selection=$(zenity --list --imagelist --print-column=2 --width=200 --height=220 --column="Image" --column="Function" \
	--text="Make your fucking choise" --title="i3 Logout Session" --hide-header \
	"$shutdownicon" "Shutdown" \
	"$rebooticon" "Reboot" \
	"$suspendicon" "Suspend" \
	"$hibernateicon" "Hibernate" \
	"$logouticon" "Logout i3" )

	case "$selection" in
		"Shutdown")		systemctl poweroff ;;
		"Reboot")		systemctl reboot ;;
		"Suspend")		systemctl suspend ;;
		"Hibernate")	systemctl hibernate ;;
		"Logout i3")	i3-msg exit ;;
	esac
}
#
run_check
[[ $RUNCHECK -eq 1 ]] && notification ;
i3logout
