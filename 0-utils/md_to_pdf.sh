#! /bin/sh

[ -x /usr/bin/pandoc ] || exit 1

INPUT="$(realpath "$1")"
OUTPUT="$(realpath "$2")"

pandoc "$INPUT" \
	-o "$OUTPUT" \
	-f markdown \
	--toc \
	--toc-depth=4 \
	-V "geometry:margin=.5in" \
	-V "toc-title:Indice"

