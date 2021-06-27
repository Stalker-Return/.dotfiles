#!/bin/bash

rm -rf ~/.cache/*
exitcode=$?
echo "Cache in the home directory cleaned: $(date), exit code: $exitcode" >> $HOME/.local/share/log-files/del_cache.log
