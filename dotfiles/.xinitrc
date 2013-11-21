#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

#if [ -d /etc/X11/xinit/xinitrc.d ]; then
#  for f in /etc/X11/xinit/xinitrc.d/*; do
#    [ -x "$f" ] && . "$f"
#  done
#  unset f
#fi

export XMODIFIERS='@im=uim'
export GTK_IM_MODULE='uim'
export QT_IM_MODULE='uim'
uim-xim &

#export XMODIFIERS="@im=ibus"
#export GTK_IM_MODULE="ibus"
#export QT_IM_MODULE="xim"
#ibus-daemon -dx &

#export GTK_IM_MODULE_FILE=/etc/gtk-2.0/gtk.immodules
#export GTK_IM_MODULE_FILE=/usr/lib/gtk-3.0/3.0.0/immodules.cache

#exec awesome
exec cinnamon-session
#exec gnome-session
#exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
