#!/bin/bash

shopt -s nullglob

if [[ ! -f $1 ]]; then
	echo "$0: first argument is not a file" >&2
	exit 1
fi

# echo -e $1

 file=$(basename -- "$1")
 dir=$(dirname -- "$1")
 arr=()
 shift

 cd -- "$dir"

 for i in *; do
	[[ -f $i ]] || continue
	arr+=("$i")
	[[ $i == $file ]] && c=$((${#arr[@]} - 1))
done

exec feh -B black -g 600x450 -d -. "$@" -- "${arr[@]:c}" "${arr[@]:0:c}"
