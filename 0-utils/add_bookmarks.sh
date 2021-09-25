#! /bin/sh

which gs >/dev/null 2>&1       || { echo "gs is required"; exit 1; }
which realpath >/dev/null 2>&1 || { echo "realpath is required"; exit 1; }

if [ -z "$1" ] || [ "$1" = "--help" ] || [ "$1" = '-h' ]; then
	echo "add_bookmarks.sh input bookmarks output"
	exit 0
fi

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
	echo 'Missing path'
	exit 1
fi

INPUT="$(realpath "$1")"
OUTPUT="$(realpath "$3")"
BOOKMARKS="$(realpath "$2")"

if [ "$INPUT" = "$OUTPUT" ]; then
	echo 'Output cannot be the same as input'
	exit 1
fi

gs -dBATCH -dNOPAUSE -dSAFER -sDEVICE=pdfwrite -sOutputFile="$OUTPUT" \
	"$BOOKMARKS" -f "$INPUT"

