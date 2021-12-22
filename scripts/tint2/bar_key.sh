#/bash/bin

# Dependencies: xkblayout-state

keylayout () {
	KEYBOARD=$(xkblayout-state print '%s')
	#KEYICON="\U0002328"
		case $KEYBOARD in
			"us")	KEYBANNER="US 🇺🇸" ;;
			"ru")	KEYBANNER="RU 🇷🇺" ;;
			"ua")	KEYBANNER="UA 🇺🇦" ;;
			*)		KEYBANNER="N/A" ;;
		esac
	echo -e "$KEYBANNER"
}

keylayout
