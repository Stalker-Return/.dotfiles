#!/bin/bash

sudo journalctl --vacuum-time=2weeks
exitcode=$?
echo "Journal directory cleaned: $(date), exit code: $exitcode" >> $HOME/.local/share/log-files/clean_journal.log