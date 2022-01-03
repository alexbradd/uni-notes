#! /bin/sh

which gs >/dev/null 2>&1       || { echo "gs is required"; exit 1; }
which realpath >/dev/null 2>&1 || { echo "realpath is required"; exit 1; }
which convert >/dev/null 2>&1  || { echo "convert is required"; exit 1; }
which exiftool >/dev/null 2>&1 || { echo "exiftool is required"; exit 1; }
which qpdf >/dev/null 2>&1     || { echo "qpdf is required"; exit 1; }

TMP_FILE_NAME="/tmp/$RANDOM.pdf"

err_rm_tmp() {
	rm "$TMP_FILE_NAME"
	exit 1
}

convert_to_tmp_pdf() {
	input_folder="$(realpath $1)"
  	imgs="$(find $input_folder \
    -maxdepth 1 \
    -type f -iname *.png -or -iname *.jpeg -or -iname *.jpg | sort)"
	# ppi for 6th gen iPad (i take notes on that)
	# if i'll feel like i'll add options to specify quality/density
	convert $imgs -density 264 -compress jpeg -quality 90 "$TMP_FILE_NAME" ||
		exit 1
	exiftool -All= -overwrite_original "$TMP_FILE_NAME" ||
		err_rm_tmp
	qpdf --linearize --replace-input "$TMP_FILE_NAME" || err_rm_tmp
}

add_bookmarks_to_tmp() {
	bookmarks_path="$(realpath $1)"
	new_tmp="/tmp/$RANDOM.pdf"
	gs -o "$new_tmp" -sDEVICE=pdfwrite "$bookmarks_path" -f "$TMP_FILE_NAME" &&
		rm "$TMP_FILE_NAME" &&
		TMP_FILE_NAME="$new_tmp" ||
		exit 1
}

move_tmp_to_output() {
	output="$(realpath $1)"
	if [ -f "$output" ]; then
		read -r -p "Overwrite $1 [y/N]? "
		if [ "$REPLY" != "y" ] && [ "$REPLY" != "Y" ]; then
			echo 'Skipped...'
			rm "$TMP_FILE_NAME"
			exit 0
		fi
	fi
	mv "$TMP_FILE_NAME" "$output"
}

if [ -z "$1" ] || [ "$1" = "--help" ] || [ "$1" = '-h' ]; then
	echo "img_to_pdf.sh input_folder [bookmarks] output"
	exit 0
fi

convert_to_tmp_pdf $1

if [ -z "$3" ]; then
	move_tmp_to_output $2
else
	add_bookmarks_to_tmp $2
	move_tmp_to_output $3
fi
