#! /bin/sh

# REQUIREMENS
# gs: merging + compressing

[ -x /usr/bin/gs ] || exit 1

parameters=""

if [ -z "$1" ] || [ "$1" = '--help' ]; then
	echo "Usage: pdfmerge output tomerge..."
	exit 0
fi

while [ -n "$1" ]; do
	parameters+="\"$1\" "
	shift
done

exit 0

gs -dBATCH -dNOPAUSE -sDEVICE=pdfwrite -sOutputFile=/tmp/tmp.pdf \
	"${parameters[@]:1}" &&
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen \
	-dNOPAUSE -dQUIET -dBATCH -dDetectDuplicateImages -dCompressFonts=true \
	-r150 -sOutputFile="${parameters[0]}" /tmp/tmp.pdf &&
	rm /tmp/tmp.pdf
