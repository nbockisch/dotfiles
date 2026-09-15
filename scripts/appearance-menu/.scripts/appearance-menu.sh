#!/usr/bin/env bash
set -uo pipefail

WALLPAPER_DIR="$HOME/pictures/wallpapers"
COLORS_DIR="$HOME/.config/colors"

list_wallpapers() {
    find -L "$WALLPAPER_DIR" -maxdepth 1 -type f ! -name current \
        \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.gif' \) |
        sort |
        while read -r path; do
            name=$(basename "$path")
            printf '%s\0icon\x1f%s\n' "${name%.*}" "$path"
        done
}

list_schemes() {
    find "$COLORS_DIR" -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | sort
}

set_wallpaper() {
    ln -sfn "$1" "$WALLPAPER_DIR/current"
    pkill -x swaybg
    swaybg -m fill -i "$WALLPAPER_DIR/current" >/dev/null 2>&1 &
    disown
}

set_scheme() {
    ln -sfn "$1" "$COLORS_DIR/current"
    makoctl reload
    pkill -SIGUSR2 -x waybar
    pkill -SIGUSR2 -x ghostty
    pkill -SIGUSR1 -x nvim
    hyprctl reload >/dev/null
}

pick_wallpaper() {
    local sel path
    sel=$(list_wallpapers | rofi -dmenu -i -show-icons -p "Wallpaper") || return 0
    [ -n "$sel" ] || return 0

    path=$(find -L "$WALLPAPER_DIR" -maxdepth 1 -type f -name "$sel.*" | head -1)
    [ -n "$path" ] && set_wallpaper "$path"
}

pick_scheme() {
    local sel
    sel=$(list_schemes | rofi -dmenu -i -p "Colour scheme") || return 0
    [ -n "$sel" ] || return 0
    [ -d "$COLORS_DIR/$sel" ] && set_scheme "$sel"
}

main() {
    local choice
    choice=$(printf 'Wallpaper\nColour scheme\n' | rofi -dmenu -i -p "Appearance") || exit 0

    case "$choice" in
        Wallpaper) pick_wallpaper ;;
        "Colour scheme") pick_scheme ;;
    esac
}

main
