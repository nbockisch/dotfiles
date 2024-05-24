#! /bin/sh
# Originally written by Eric Murphy (ericmurphyxyz on GitHub)

chosen=$(printf "  Power Off\n  Restart\n  Suspend\n  Hibernate\n  Log Out\n  Lock" | rofi -dmenu -i)

case "$chosen" in
    "  Power Off") sudo poweroff ;;
    "  Restart") sudo reboot ;;
    "  Suspend") sudo systemctl suspend-then-hibernate ;;
    "  Hibernate") sudo systemctl hibernate ;;
    "  Log Out") bspc quit && exit ;;
    "  Lock") betterlockscreen -l ;;
    *) exit 1 ;;
esac
