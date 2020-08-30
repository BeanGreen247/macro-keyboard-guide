#!/bin/bash
button=$1

if [[ $button == "up" ]] ; then
	xdotool key ctrl+alt+t #terminal
fi
if [[ $button == "down" ]] ; then
	xdotool key ctrl+alt+f #filemanager
fi
if [[ $button == "left" ]] ; then
	xdotool key ctrl+alt+w #firefox
fi
if [[ $button == "right" ]] ; then
	xdotool key ctrl+alt+c #code
fi
if [[ $button == "rctrl" ]] ; then
	pcmanfm Downloads/
fi
if [[ $button == "rmenu" ]] ; then
	kdenlive
fi
