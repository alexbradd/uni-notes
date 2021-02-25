#! /bin/sh

[ -x /usr/bin/pandoc ] || { echo "pandoc is required"; exit 1; }
[ -x /usr/bin/realpath ] || { echo "realpath is required"; exit 1; }

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
	-f markdown \
	$TOC \
	-V "geometry:margin=.5in" \
	-V "toc-title:Indice"

