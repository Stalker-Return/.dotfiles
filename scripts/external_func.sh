#!/bin/bash
#
# Standard functions fot user's script
#
# Check root user
function checkroot()
{
if [ "$EUID" -ne 0 ]
  then	echo "Permission denied ..."
		echo "Please run as root"
		sleep 2
  exit
fi
}
#
# Check exit code
function exitcontrol() {
	case $exitcode in
		"0" )	codedescription="'Success'" ;;
		"1" )	codedescription="'Catchall for general errors'" ;;
		"2" )	codedescription="'Misuse of shell builtins'" ;;
		"126" )	codedescription="'Command invoked cannot execute'" ;;
		"127" )	codedescription="'Command not found'" ;;
		"128" ) codedescription="'Invalid argument to exit command'" ;;
		"130" ) codedescription="'Bash script terminated by Control-C'" ;;
		* )		codedescription="'Unknown exit code'" ;;
	esac
}
