#!/bin/bash

while getopts :f: opt; do
  case $opt in
    f)
      echo "argument = $OPTARG"
      ;;
    \?)
      echo "Invalid option: -$OPTARG"
      exit
      ;;
    :)
      echo "Option -$OPTARG requires an argument."
      exit
      ;;
  esac

      case $OPTARG in
        "shd")
			zencommand=$(
			zenity --question --width="240" --height="70" \
			--text "Shutting down of a fucking bullshit ?" \
			--ok-label "Bye-bye bro" --cancel-label="Fuck off!"; echo $?
			)
				if [ $zencommand = 0 ]; then systemctl poweroff
					else exit
				fi
            ;;
        "reb")
			zencommand=$(
			zenity --question --width="240" --height="70" \
			--text "For fuck's sake! Reboot it again?" \
			--ok-label "Yeah buddy" --cancel-label="Fuck you bro"; echo $?
			)
				if [ $zencommand = 0 ]; then systemctl reboot
					else exit
				fi
            ;;
        "ssp")
			zencommand=$(
			zenity --question --width="240" --height="70" \
			--text "Gonna fucking suspend?" \
			--ok-label "Fucking Yeah" --cancel-label="Fucking Nope"; echo $?
			)
				if [ $zencommand = 0 ]; then systemctl suspend
					else exit
				fi
            ;;
        "hbr")
        	zencommand=$(
			zenity --question --width="240" --height="70" \
			--text "Gonna fucking hibernate?" \
			--ok-label "Good bastard" --cancel-label="Bullshit"; echo $?
			)
				if [ $zencommand = 0 ]; then systemctl hibernate
					else exit
				fi
            ;;
         "opex")
			zencommand=$(
			zenity --question --width="250" --height="70" \
			--text "Un-fucking-acceptable to logout, man" \
			--ok-label "Who gives a fuck?" --cancel-label="Fuck it"; echo $?
			)
				if [ $zencommand = 0 ]; then openbox --exit
					else exit
				fi
            ;;
		*) echo "invalid option $REPLY";;
    esac

done
