#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

set -x
set -e

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

intel-virtual-output -b && xrandr --output VIRTUAL1 --right-of eDP1 --preferred || echo "No external monitor connected"

eval $(/usr/bin/gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

if [ `hostname` == 'ei-grad-msi' ]; then
    libinput-gestures-setup start
    xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" 1
fi

setxkbmap us,ru ,winkeys grp:caps_toggle,grp_led:scroll,compose:ralt

xset b off

xcompmgr &

if [ "$DESKTOP_GLMATRIX" == "1" ]; then
    xwinwrap -b -fs -sp -fs -nf -ov -- /usr/lib/xscreensaver/glmatrix -root -window-id WID &
else
    feh --bg-fill ~/arch_linux-wallpaper-1920x1080.jpg
fi

redshift -l 55.565654:37.340223 -t 5200:3200 &

nm-applet &

pcmanfm -d &

wmname LG3D
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel' _JAVA_AWT_WM_NONREPARENTING=1

export WINEARCH=win32

exec qtile
