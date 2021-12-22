#!/bin/bash
#
# Standard functions fot user's script
#
# Check root user
function checkroot()
{
if [ "$EUID" -ne 0 ]
  then	echo -e "Permission denied. Please run as root.\n\033[5mExit in 5 seconds...\033[0m" && sleep 5
  exit
fi
}
#
# Check exit code
function exitcontrol() {
	case $exitcode in
		0 )		codedescription='Success' ;;
		1 )		codedescription='Catchall for general errors' ;;
		2 )		codedescription='Misuse of shell builtins' ;;
		5 )		codedescription='File does not exist' ;;
		85 )	codedescription='No such folder' ;;
		126 )	codedescription='Command invoked cannot execute' ;;
		127 )	codedescription='Command not found' ;;
		128 )	codedescription='Invalid argument to exit command' ;;
		130 )	codedescription='Bash script terminated by Control-C' ;;
		* )		codedescription='Unknown exit code: $exitcode' ;;
	esac
}
#
### Colors name
function colorsname() {
	Black="\e[0;30m"
	Red="\e[1;31m"
	Green="\e[0;32m"
	Yellow="\e[0;33m"
	Blue="\e[1;34m"
	Pink="\e[1;35m"
	Cyan="\e[1;36m"
	White="\e[0;37m"
	BlinkOn="\033[5m"
	BlinkOff="\e[0m"
	RedBG="\e[1;41m"
	GreenBG="\e[0;42m"
	YellowBG="\e[0;43m"
	BlueBG="\e[1;44m"
	PinkBG="\e[1;45m"
	CyanBG="\e[1;46m"
	WhiteBG="\e[0;47m"
	BlackBG="\e[0;40m"
	printf '\e[4 q'			# blinking underline cursor
}
