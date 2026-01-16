#!/bin/bash

WALLPAPER_DIR="$HOME/pictures/wallpapers/"

menu() {
    find "${WALLPAPER_DIR}" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) | awk '{print "img:"$0}'
}

main() {
    choice=$(menu | wofi --show dmenu --prompt "Select Wallpaper:" -n)
    selected_wallpaper=$(echo "$choice" | sed 's/^img://')
    wallust run $selected_wallpaper
    swaybg -m fill -i $selected_wallpaper
}

main
