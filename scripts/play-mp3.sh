#!/bin/bash
# Play *.mp3 files randomly from the Music folder
# command format: play-mp3.sh $1, ( $1 - path to *.mp3 files, for example: play-mp3.sh $HOME/Music/ )
# dependancies: ffmpeg
mp3dir=$1
mp3list=$mp3dir'playlist.txt'
[[ -e $mp3list ]] && rm -R $mp3list
find $mp3dir -type f -name "*.mp3" | shuf > $mp3list
[[ -e $mp3list ]] && playlist=$mp3list || echo -e "\e[1;93mNothing to do \e[0m";

while read filename
	do
		ffplay -i  -x 300 -y 180 -autoexit -- "$filename";
	done < $playlist
