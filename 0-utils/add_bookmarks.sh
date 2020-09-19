#! /bin/sh

# REQUIREMENTS
# gs: read postscript script to add bookmarks

[ -x /usr/bin/gs ] || exit 1

if [ -z "$1" ] || [ "$1" = "--help" ]; then
	echo "add_bookmarks.sh input bookmarks"
	exit 0
fi

INPUT="$(realpath "$1")"
BOOKMARKS="$(realpath "$2")"

gs -o /tmp/book_tmp.pdf -sDEVICE=pdfwrite "$BOOKMARKS" -f "$INPUT" &&
	mv /tmp/book_tmp.pdf "$INPUT"
