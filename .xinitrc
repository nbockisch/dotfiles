~/.xinitrc

# if [ -d /etc/X11/xinit/xinitrc.d ]; then
# 	for f in /etc/X11/xinit/xinitrc.d/?* ; do
# 		[ -x "$f" ] && . "$f"
# 	done
# 	unset f
# fi

xsetroot -cursor_name left_ptr
xset -dpms # Disables Energy Star features
xset s off # Disables screen saver

exec bspwm
