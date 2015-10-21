#!/bin/bash
	sleep 4

	screendata=$(xrandr | perl -ne 'if (/(^\w+)\W+connected\W+(\d+)x(\d+)([+-]\d+)([+-]\d+)/) {print "$1 $2 $3 $4 $5\n";}')
	monitors=$(xrandr | grep "connected" | wc -l)
	xpos=1321
	ypos=5

#	echo -e "$screendata\nmonitors: $monitors\nxpos: $xpos\nypos: $ypos" > ~/debugopenbox
	if [ "$monitors" == "2" ] ; then
		#(( ypos += 900 ))
		(( xpos -= 120 ))
#		echo "if entered" >> ~/debugopenbox
	fi

#	echo "xpos=$xpos ypos=$ypos" >> ~/debugopenbox
	nitrogen --restore
	tint2 &
	volti &
#	conky -b -x $xpos -y $ypos &
#	nm-applet &

	if ! dropbox running ; then
		dropbox stop
	fi
	dropbox start

