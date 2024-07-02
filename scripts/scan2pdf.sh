#!/usr/bin/env bash

if [ "$1" == "" ]; then
    pdf_name="SCAN_$(date +%Y-%m-%d_%H%M%S)"
    echo "[PDF] No name was given. Chose $pdf_name.pdf."
else
    pdf_name="$1"
fi

echo "[PDF] Scanning to .png ..."
scanimage > "$pdf_name".png

echo "[PDF] Converting to uncompressed .pdf ..."
convert "$pdf_name".png "$pdf_name"_large.pdf

echo "[PDF] Compressing .pdf ..."
ps2pdf "$pdf_name"_large.pdf "$pdf_name".pdf

printf "[PDF] Do not remove .png and uncompressed .pdf? Then type NO: "
read want_remove
if ! [ "$want_remove" == "NO" ]; then
    echo "[PDF] Removing unnecessary output ..."
    rm "$pdf_name".png "$pdf_name"_large.pdf
fi

unset -v pdf_name want_remove
