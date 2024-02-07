#!/bin/bash

current_dir="$(pwd)"

if [ "$1" == "" ]; then
    echo ">> No PDF file name was given!"
    exit 1
else
    pdf_name="$(basename "$1" .pdf)"
    if [ "$2" == "" ]; then
        new_pdf_name="$pdf_name"_clock
        echo ">> No name was given for the new PDF. Chose: $new_pdf_name.pdf"
    else
        new_pdf_name="$2"
    fi
    pdftk \
        "$current_dir"/"$pdf_name".pdf \
        cat 1-endeast output \
        "$current_dir"/"$new_pdf_name".pdf
fi

unset -v new_pdf_name pdf_name current_dir
