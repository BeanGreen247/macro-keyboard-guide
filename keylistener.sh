#!/bin/bash
devid=12 #change based on output of xinput list
xinput test $devid | while read in ; do
	[[ $in = "key press   191" ]] && ./inputAction.sh up
	[[ $in = "key press   113" ]] && ./inputAction.sh left
	[[ $in = "key press   114" ]] && ./inputAction.sh right
	[[ $in = "key press   116" ]] && ./inputAction.sh down
	[[ $in = "key press   105" ]] && ./inputAction.sh rctrl
	[[ $in = "key press   135" ]] && ./inputAction.sh rmenu
done	
