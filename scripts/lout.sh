#!/bin/bash
# A simple script to make system logout easier
# dependansies: zenity, pidof
# Check if pacman is running
run_check (){
	[ -z "$(pidof pacman)" ] || RUNCHECK=1
	[ -z "$(pidof yay)" ] || RUNCHECK=1
	[ -z "$(pidof paru)" ] || RUNCHECK=1
}
# Notification
function notification(){
	zenity --warning --text="Your shit system update is in a fucking progress, bro" --no-wrap
	exit 5
}
#
run_check
[[ $RUNCHECK -eq 1 ]] && notification ;
#
while getopts :f: opt; do
  case $opt in
    f)	: ;;
    \?)	echo "Invalid option: -$OPTARG" && exit ;;
    :)	echo "Option -$OPTARG requires an argument." && exit ;;
  esac
#
      case $OPTARG in
		"shd")	zenity --question --no-wrap --timeout=20 --text "Shutting down of a fucking bullshit ?" \
				--ok-label "Bye-bye bro" --cancel-label="Fuck off!"
				[[ $? -eq 1 ]] && exit || systemctl poweroff
				;;
		"reb")	zenity --question --no-wrap --timeout=20 --text "For fuck's sake! Reboot it again?" \
				--ok-label "Yeah buddy" --cancel-label="Fuck you bro"
				[[ $? -eq 1 ]] && exit || systemctl reboot
				;;
		"ssp")	zenity --question --no-wrap --timeout=20 --text "Gonna fucking suspend?" \
				--ok-label "Fucking Yeah" --cancel-label="Fucking Nope"
				[[ $? -eq 1 ]] && exit || systemctl suspend
				;;
		"hbr")	zenity --question --no-wrap --timeout=20 --text "Gonna fucking hibernate?" \
				--ok-label "Good bastard" --cancel-label="Bullshit"
				[[ $? -eq 1 ]] && exit || systemctl hibernate
				;;
		"opex")	zenity --question --no-wrap --timeout=20 --text "Un-fucking-acceptable to logout, man" \
				--ok-label "Who gives a fuck?" --cancel-label="Fuck it"
				[[ $? -eq 1 ]] && exit || openbox --exit
				;;
		*)		echo "invalid option $OPTARG" ;;
    esac

done
