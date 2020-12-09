#! /bin/sh

[ -x /usr/bin/gs ] || { echo "gs is required"; exit 1; }
[ -x /usr/bin/realpath ] || { echo "realpath is required"; exit 1; }

if [ -z "$1" ] || [ "$1" = "--help" ] || [ "$1" = '-h' ]; then
	echo "add_bookmarks.sh input bookmarks"
	exit 0
fi

INPUT="$(realpath "$1")"
BOOKMARKS="$(realpath "$2")"

gs -o /tmp/book_tmp.pdf -sDEVICE=pdfwrite "$BOOKMARKS" -f "$INPUT" &&
	mv /tmp/book_tmp.pdf "$INPUT"
