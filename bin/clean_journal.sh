#!/bin/bash

sudo journalctl --vacuum-time=2weeks
echo "Journal directory cleaned: $(date)" >> $HOME/.local/share/log-files/clean_journal.log