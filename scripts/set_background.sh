#!/bin/bash

# shopt -s nullglob


if [[ ! -f $1 ]]; then
	echo "$0: first argument is not a file" >&2
	exit 1
fi

# echo -e $1

exec feh --bg-scale $1
