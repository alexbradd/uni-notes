#! /bin/sh

which pandoc >/dev/null 2>&1   || { echo "pandoc is required"; exit 1; }
which realpath >/dev/null 2>&1 || { echo "realpath is required"; exit 1; }

TOC="--toc"
case "$1" in
	""|"--help"|"-h")
		echo "md_to_pdf.sh [ --no-toc | --toc-depth N ] input output"
		exit 0 ;;
	"--toc-depth")
		if [ -z "$(echo "$2"| grep -Ev '[0-9]+')" ]; then
			TOC+=" --toc-depth=$2"
			shift 2
		else
			echo "Invalid number: '$2'"
			exit 1
		fi ;;
	"--no-toc")
		TOC=""
		shift 1 ;;
esac

INPUT="$(realpath "$1")"
OUTPUT="$(realpath "$2")"

pandoc "$INPUT" \
	-o "$OUTPUT" \
	-t pdf \
	$TOC \
	--shift-heading-level-by=-1 \
	--pdf-engine="pdflatex" \
	-V "documentclass:article" \
	-V "classoptions:11pt" \
	-V "fontenc:T1" \
	-V "geometry:margin=2cm,bindingoffset=6mm,twoside" \
	-V "toc-title:Indice"

