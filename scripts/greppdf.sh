#!/bin/bash

dir_name="$(dirname "$1")"
base_name="$(basename "$1" .pdf)"
pdf_name="$dir_name/$base_name.pdf"
txt_name="$dir_name/$base_name.txt"

pdftotext "$pdf_name" "$txt_name"

if ! [ "$2" == "" ]; then
    grep -rni --color=always "$2" "$txt_name"
fi

rm -f "$txt_name"
