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

#export XMODIFIERS="@im=fcitx"
#export LANG=zh_CN.utf8
#export LC_CTYPE="zh_CN.utf8" 
#export LC_MESSAGES="zh_CN.utf8" 
#export XMODIFIERS="@im=fcitx" 
#export GTK_IM_MODULE=fcitx  
#export QT_IM_MODULE=fcitx  
#export XIM=fcitx 
#export XIM_PROGRAM=fcitx 
#export XDM_MENU_PREFIX=gnome-
#gksudo polkit-gnome-authorization
#exec ck-launch-session gnome-session
#exec ck-launch-session dbus-launch --sh-syntax --exit-with-session gnome-session
export DISPLAY=":0.0"
exec startxfce4 --with-ck-launch
