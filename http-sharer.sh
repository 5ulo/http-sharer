#!/bin/sh 
# date for unicate link
date=$(date +%Y-%m-%d-%H-%M-%S)
# public accessible url link
url="http://your-domain.tld/share/"
# symlink destination path
sharepath="/data/http/default/share/"
# filename + file extension
file=$(basename $1)
# create symlink in format date-filename
ln -s $1 $sharepath$date"-"$file
# create full http link for sharing
link=$url$date"-"$file
# copy in clipboard
echo $link | xclip -sel clip
# output info via zenity dialog or default notification server (eg. libnotify) - comment out what you prefer
# zenity --info --title="Copied" --text $link
notify-send -i preferences-system-sharing "Copied" $link
