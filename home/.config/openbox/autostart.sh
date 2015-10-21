# Run the system-wide support stuff
# it is located in: /etc/xdg/openbox/autostart.sh
. $GLOBALAUTOSTART

# Programs to launch at startup
#hsetroot ~/wallpaper.png &
#xcompmgr -c -t-5 -l-5 -r4.2 -o.55 &

# SCIM support (for typing non-english characters)
#export LC_CTYPE=ja_JP.utf8
#export XMODIFIERS=@im=SCIM
#export GTK_IM_MODULE=scim
#export QT_IM_MODULE=scim
#scim -d &

#xrandr &> ~/saida.xrandr

# Programs that will run after Openbox has started
#(sleep 2 && tint2) &
#(sleep 2 && conky -b -x 1321 -y 5) &
#(sleep 2 && gnome-volume-control-applet) &
#(sleep 2 && gnome-power-manager) &
#(sleep 2 && nm-applet) &
#(sleep 2 && dropbox) &
#nitrogen --restore &

/usr/bin/setxkbmap us -variant alt-intl

~/.config/openbox/delayinit.sh &



#(\
#	sleep 4
#	screendata=$(xrandr | perl -ne 'if (/(^\w+)\W+connected\W+(\d+)x(\d+)([+-]\d+)([+-]\d+)/) {print "$1 $2 $3 $4 $5\n";}')
#	monitors=$(xrandr | grep "connected" | wc -l)
#	xpos=1321
#	ypos=5
#
#	echo "$screendata\nmonitors: $monitors\nxpos: $xpos\nypos: $ypos" > ~/debugopenbox
#	if [ "$monitors" == "2" ] ; then
#		(( $ypos = $ypos + 900 ))
#		echo "if entered" >> ~/debugopenbox
#	fi
#	echo "xpos=$xpos ypos=$ypos" >> ~/debugopenbox
#	nitrogen --restore
#	tint2 &
#	conky -b -x $xpos -y $ypos &
#	gnome-volume-control-applet &
#	gnome-power-manager &
#	nm-applet &
#	dropbox &
#	x-terminal-emulator &	
#) &
