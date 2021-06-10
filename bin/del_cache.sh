#!/bin/bash

rm -rf ~/.cache/*
echo "Cache in the home directory cleaned: $(date)" >> $HOME/.local/share/log-files/del_cache.log
