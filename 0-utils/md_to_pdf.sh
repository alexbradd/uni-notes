#! /bin/sh

[ -x /usr/bin/pandoc ] || exit 1

TOC="--toc --toc-depth=4"
case "$1" in
	""|"--help")
		echo "md_to_pdf.sh [ --no-toc ] input output"
		exit 0 ;;
	"--no-toc")
		TOC=""
		shift 1 ;;
esac

INPUT="$(realpath "$1")"
OUTPUT="$(realpath "$2")"

pandoc "$INPUT" \
	-o "$OUTPUT" \
	-f markdown \
	$TOC \
	-V "geometry:margin=.5in" \
	-V "toc-title:Indice"

