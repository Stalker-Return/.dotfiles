#!/bin/bash
zencommand=$(
	zenity --question --width="240" --height="70" \
	--text "Gonna fucking shutdown?" \
	--ok-label "Yeah Buddy" --cancel-label="Fucking Nope"; echo $?
)

if [ $zencommand = 0 ]; then systemctl poweroff
	else exit
fi

exit
