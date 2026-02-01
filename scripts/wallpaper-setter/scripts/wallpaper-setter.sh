#!/bin/bash

WALLPAPER_DIR="$HOME/pictures/wallpapers/"

menu() {
    find "${WALLPAPER_DIR}" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) | awk '{print "img:"$0}'
}

main() {
    choice=$(menu | wofi --style /home/nathan/.config/wofi/style.css --show dmenu --prompt "Select Wallpaper:" -n)
    selected_wallpaper=$(echo "$choice" | sed 's/^img://')
    cp $selected_wallpaper $WALLPAPER_DIR/current
    wallust run $WALLPAPER_DIR/current
    swaybg -m fill -i $WALLPAPER_DIR/current
}

main
