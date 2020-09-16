#! /bin/sh -e

parameters=($@)

if [ -z "$parameters" ] || [ "$parameters" == '--help' ]; then
    echo "Usage: pdfmerge output tomerge..."
    exit 0
fi

# Check for gs
which gs 1>/dev/null 2>&1 || { echo "gs, not installed. Aborting"; exit 1; }

# Merge
gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=/tmp/tmp.pdf ${parameters[@]:1}

# Compress
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -dDetectDuplicateImages -dCompressFonts=true -r150 -sOutputFile=${parameters[0]} /tmp/tmp.pdf

rm /tmp/tmp.pdf
