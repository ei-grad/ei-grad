#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

eval $(/usr/bin/gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

xcompmgr &
#setxkbmap us,ru ,winkeys grp:caps_toggle,grp_led:scroll,compose:ralt
xset b off
xset +fp /usr/share/fonts/local/
#xwinwrap -b -fs -sp -fs -nf -ov -- /usr/lib/xscreensaver/glmatrix -root -window-id WID &
feh --bg-fill ~/arch_linux-wallpaper-1920x1080.jpg
redshift -l 55.565654:37.340223 -t 5200:3200 &
nm-applet &
pcmanfm -d &

wmname LG3D
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel' _JAVA_AWT_WM_NONREPARENTING=1

export WINEARCH=win32

exec qtile
