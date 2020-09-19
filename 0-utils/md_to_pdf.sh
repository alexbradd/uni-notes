#! /bin/sh

# REQUIREMENTS
# pandoc: conversion
# pdflatex: exporting to pdf (needs texlive-scheme-medium)
# rsvg-convert: embedding svg

[ -x /usr/bin/pandoc ] || exit 1
[ -x /usr/bin/pdflatex ] || exit 1
[ -x /usr/bin/rsvg-convert ] || exit 1

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

