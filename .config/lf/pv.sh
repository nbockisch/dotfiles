#!/bin/sh

# Handles previews for lf

case "$(file --dereference --brief --mime-type -- "$1")" in
	image/*) ctpv "$1" "$2" "$3" "$4" "$5" "$1" ;;
	text/troff) man ./ "$1" | col -b ;;
	text/* | */xml | application/json) bat --terminal-width "$(($4-2))" -f "$1" ;;
	audio/* | application/octet-stream) mediainfo "$1" || exit 1 ;;
	*tar*) tar tf "$1" ;;
	application/*zip) unzip -l "$1" ;;
	application/*.rar) unrar l "$1" ;;
	*/pdf) pdftotext "$1" -;;
	*opendocument*) odt2txt "$1" ;;
	application/pgp-encrypted) gpg -d -- "$1" ;;
	*) highlight -O ansi "$1" ;;
esac
