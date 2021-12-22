#!/bin/bash

shopt -s nullglob

if [[ ! -f $1 ]]; then
	echo "$0: first argument is not a file" >&2
	exit 1
fi

file=$(basename -- "$1")
dir=$(dirname -- "$1")
#cd -- "$dir"

echo -e $file
echo -e $dir

#exec ffplay -i '$file'
