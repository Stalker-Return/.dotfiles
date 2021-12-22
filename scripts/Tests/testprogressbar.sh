#!/bin/bash
# External source
source ~/scripts/notifyme.sh
# Upload external functions
checkfile=/home/ed/scripts/external_func.sh
[[ -e $checkfile ]] && source $checkfile || echo -ne "$checkfile doesn't exist";
[[ ! -e $checkfile ]] && exist 3 || clear;

fooo >/dev/null
