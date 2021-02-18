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

[ -x `which fix-source-vol` ] && fix-source-vol 0.25 &

eval $(/usr/bin/gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

if [ `hostname` == 'ei-grad-msi' ]; then
    if [ -x `which intel-virtual-output` ]; then
        intel-virtual-output -b && \
            xrandr --output HDMI-1 --preferred --pos 1920x-360 && \
            xrandr --output VIRTUAL1 --right-of eDP1 --preferred || \
            echo "No external monitor connected"
    fi
    libinput-gestures-setup start
    xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" 1
fi

setxkbmap us,ru ,winkeys grp:caps_toggle,grp_led:scroll,compose:ralt

xset b off

xcompmgr &

if [ "$DESKTOP_GLMATRIX" == "1" ]; then
    xwinwrap -b -fs -sp -fs -nf -ov -- /usr/lib/xscreensaver/glmatrix -root -window-id WID &
else
    feh --bg-max ~/arch_linux-wallpaper-1920x1080.jpg
fi

redshift -l 55.565654:37.340223 -t 5200:3200 &

nm-applet &

pcmanfm -d &

wmname LG3D
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel' _JAVA_AWT_WM_NONREPARENTING=1

export WINEARCH=win32

exec qtile
