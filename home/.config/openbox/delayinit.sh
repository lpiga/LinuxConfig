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
	xcompmgr &
	tint2 &
	pnmixer &
	#	conky -b -x $xpos -y $ypos &
	#	nm-applet &
	dropbox_count=0
	while ! dropbox running ; do
	    dropbox stop
	    sleep 1
	    dropbox_count=$((${dropbox_count}+1))
	    if [ ${dropbox_count} -ge 10 ] ; then
		break;
	    fi
	done
	dropbox start -i

