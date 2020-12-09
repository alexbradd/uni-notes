#! /bin/sh

[ -x /usr/bin/pandoc ] || { echo "pandoc is required"; exit 1; }
[ -x /usr/bin/realpath ] || { echo "realpath is required"; exit 1; }

TOC="--toc --toc-depth=4"
case "$1" in
	""|"--help"|"-h")
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

