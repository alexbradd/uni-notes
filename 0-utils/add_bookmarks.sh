#! /bin/sh

[ -x /usr/bin/gs ] || exit 1
[ -x /usr/bin/realpath ] || exit 1

INPUT="$(realpath "$1")"
BOOKMARKS="$(realpath "$2")"

gs -o /tmp/book_tmp.pdf -sDEVICE=pdfwrite "$BOOKMARKS" -f "$INPUT" &&
	mv /tmp/book_tmp.pdf "$INPUT"
