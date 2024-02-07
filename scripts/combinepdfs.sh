#!/bin/bash

current_dir="$(pwd)"

echo "[PDF] Removing spaces, parentheses, and capital letters in file names ..."
rename 's/\ /_/g' *.pdf
rename 's/(\(|\))//g' *.pdf
rename 'y/A-Z/a-z/' *.pdf

if [ "$1" == "" ]; then
    combined_pdfs="00_all_combined.pdf"
    echo "[PDF] No name was given. Chose: 00_all_combined.pdf"
else
    combined_pdfs="$1.pdf"
fi

combined_pdfs_path="$current_dir/$combined_pdfs"

if [ -f "$combined_pdfs_path" ]; then
    echo "[PDF] Removing old $combined_pdfs ..."
    rm "$combined_pdfs_path"
fi

echo "[PDF] Combining all PDFs of this directory into $combined_pdfs ..."
pdftk $(ls "$current_dir"/*.pdf) output "$combined_pdfs_path"
if [ -f "$combined_pdfs_path" ]; then
    echo "[PDF] Combining successful."
else
    echo "[PDF] Combining failed!"
    exit 1
fi

unset -v combined_pdfs_path combined_pdfs current_dir
