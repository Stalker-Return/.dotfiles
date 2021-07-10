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
