#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/pictures/wallpapers/"
COLORSCHEME_DIR="$HOME/.config/wallust/colorschemes/"

get_wal() {
    # The awk formatting allows both the image and the image name to be displayed in Wofi
    # find "${WALLPAPER_DIR}" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) | awk '{ cmd = "basename \"" $0 "\""; cmd | getline output; close(cmd); print $0"\0icon\x1f"$WALLPAPER_DIR}'
    WALLPAPER_LIST=$(find "${WALLPAPER_DIR}" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \))
    echo -en "$WALLPAPER_LIST" | awk '{
        full_path = $0;
        basename = $0;
        gsub(/.*\//, "", basename);
        gsub(/\.[^.]+$/, "", basename);
        printf "%s\t%s\0icon\x1f%s\n", basename, full_path, full_path
    }'
}

set_wal() {
    # The first argument is the path of the selected wallpaper
    ln -sfn $1 $WALLPAPER_DIR/current
    # wallust run $WALLPAPER_DIR/current
    swaybg -m fill -i $WALLPAPER_DIR/current
    makoctl reload
}

get_colors() {
    ENTRIES=$(find "${COLORSCHEME_DIR}" -type f \( -iname "*.json" \) | awk '{ system("basename " $0) }' )
    echo -en $ENTRIES
}

main() {
    MAIN_MENU="Colorscheme\nWallpaper"

    # Select b
    CHOICE=$(echo -en $MAIN_MENU | rofi -dmenu -format 1 -p "Select Option")
    echo "CHOICE: $CHOICE"

    case $CHOICE in
        "1")
            echo "Colors?"
            get_colors
            ;;
        *)
            CHOICE=$(get_wal | rofi -dmenu -p -show-icons "Select Option")
            set_wal $CHOICE
            ;;
    esac
    # choice=$(get_wal | rofi -dmenu --prompt "Select Option:")
}

main
