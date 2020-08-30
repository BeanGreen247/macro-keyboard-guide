#!/bin/bash
button=$1

if [[ $button == "up" ]] ; then
	pcmanfm Downloads/ &!
fi
if [[ $button == "down" ]] ; then
	pcmanfm Documents/ &!
fi
if [[ $button == "left" ]] ; then
	pcmanfm Videos/ &!
fi
if [[ $button == "right" ]] ; then
	pcmanfm Pictures/ &!
fi
if [[ $button == "rctrl" ]] ; then
	pcmanfm &!
fi
if [[ $button == "rshift" ]] ; then
	clementine &!
fi
if [[ $button == "altgr" ]] ; then
	gnome-disks &!
fi
if [[ $button == "enter" ]] ; then
	filezilla &!
fi
if [[ $button == "backspace" ]] ; then
	xdotool key ctrl+alt+w &! #chrome
fi
if [[ $button == "del" ]] ; then
	xdotool key ctrl+alt+c &! #code
fi
if [[ $button == "ins" ]] ; then
	xdotool key ctrl+alt+t &! #terminal
fi
