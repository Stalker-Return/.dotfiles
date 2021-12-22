#!/bin/bash

function main(){
#	echo -e $@
	check $@
		if [ $m ]
			then echo "'m' chosen"
		fi
}

usage()
{
    echo "usage: <command> options:<w|l|h>"
}

function check(){
	local OPTIND opt i
	while getopts ":cmni:" opt; do
		case $opt in
			(i) echo "'i' chosen"; input=$OPTARG ;;
			(c) echo "'c' good option"; input=$OPTARG ;;
			(m) m=true ;;
			(n) n_func ;;
			(*) usage ;;
			(\?) echo "Invalid Option"; help ;;
		esac
	done
	
	shift $((OPTIND -1))
	echo "INPUT:" $input
	if [ "$input" = "" ]
		then echo "no option"
		else echo "option is $input"
	fi
}

function help(){
	echo "Help function"
	echo "help-help-help"
}

function n_func(){
	echo "n_funk function"
}

main $@
