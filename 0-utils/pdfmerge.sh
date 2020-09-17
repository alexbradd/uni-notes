#! /bin/sh

[ -x /usr/bin/gs ] || exit 1

parameters=($@)

if [ -z "$parameters" ] || [ "$parameters" == '--help' ]; then
	echo "Usage: pdfmerge output tomerge..."
	exit 0
fi

gs -dBATCH -dNOPAUSE -sDEVICE=pdfwrite -sOutputFile=/tmp/tmp.pdf \
	${parameters[@]:1} &&
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen \ 
	-dNOPAUSE -dQUIET -dBATCH -dDetectDuplicateImages -dCompressFonts=true \
	-r150 -sOutputFile=${parameters[0]} /tmp/tmp.pdf &&
	rm /tmp/tmp.pdf
