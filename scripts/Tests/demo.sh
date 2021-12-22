#!/bin/bash
# Help function
function usage()
{
    echo "usage: <command> options:<w|l|h>"
}
# Check if empty
function empty()
{
	if [[ $1 == "" ]]; then echo -e "FUCK"; usage; exit 1;
	fi
}
# Check arguments
	while getopts :w:l:r:h: opt; do
		case $opt in
			w) name='1'; input=$OPTARG;;
			l) name='2';;
			r) name='3';;
			h) usage; exit 1;;
			*) echo "Fucking illegal options"; usage; exit 1;;
		esac
	done
	echo -e "hi" $name $input
