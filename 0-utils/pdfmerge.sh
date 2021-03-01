#! /bin/sh

[ -x /usr/bin/gs ] || { echo "gs is required"; exit 1; }

parameters=()

if [ -z "$1" ] || [ "$1" = '--help' ] || [ "$1" = '-h' ]; then
	echo "Usage: pdfmerge output tomerge..."
	exit 0
fi

while [ -n "$1" ]; do
	parameters+=("\"$1\"")
	shift
done

echo "${parameters[@]:1}"
echo "${parameters[0]}"

gs -dBATCH -dNOPAUSE -sDEVICE=pdfwrite -sOutputFile="${parameters[0]}" \
	"${parameters[@]:1}"
