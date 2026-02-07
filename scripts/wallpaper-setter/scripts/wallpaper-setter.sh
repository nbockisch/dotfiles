#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/pictures/wallpapers/"

menu() {
    # The awk formatting allows both the image and the image name to be displayed in Wofi
    find "${WALLPAPER_DIR}" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) | awk '{ cmd = "basename \"" $0 "\""; cmd | getline output; close(cmd); print "img:"$0":text:"output}'
}

main() {
    choice=$(menu | wofi --style /home/nathan/.config/wofi/style.css --show dmenu --prompt "Select Wallpaper:" -n)
    selected_wallpaper=$(echo "$choice" | awk -F ':' '{ print $2 }')

    # Only set the color scheme and cache the wallpaper if one was selected
    if [[ -n $selected_wallpaper ]]; then
        cp $selected_wallpaper $WALLPAPER_DIR/current
        wallust run $WALLPAPER_DIR/current
        swaybg -m fill -i $WALLPAPER_DIR/current
    fi
}

main
