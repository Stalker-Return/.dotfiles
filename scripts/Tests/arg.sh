#!/bin/bash
# Help function
function usage()
{
    echo "usage: <command> options:<a|b|c>"
}
# Check if empty
function empty()
{
	if [[ $1 == "" ]]; then echo -e "FUCK"; usage; exit 1;
	fi
}
# Check arguments
	while getopts :a:b:c: options; do
		case $options in
			a) case $OPTARG in
				"full") ap="full";;
				"basic") ap="basic";;
				"") echo "$OPTARG is empty";;
				\?) echo "$OPTARG is invalid argument";;
		esac
		;;
			b) bo=$OPTARG;;
			c) cc=$OPTARG;;
			*) echo "$OPTARG is a fucking illegal key"; usage;;
		esac
	done
	
	empty
	
	MINPARAMS=$#
	echo -e "Parameter = $MINPARAMS"
	echo -e "Parameter A = $ap, Parameter B = $bo, Parameter C = $cc"
