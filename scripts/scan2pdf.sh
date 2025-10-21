#!/usr/bin/env bash

if [ "$1" == "" ]; then
    pdf_name="scan_$(date +%Y-%m-%d_%H%M%S)"
    echo "[Scanner] No name was given. Chose $pdf_name.pdf."
else
    pdf_name="$1"
fi

# NOTE:
# You can also specify the format directly with the following command.
#     scanimage --format "pdf" > "$pdf_name".pdf`
# But the produced PDF is a bit larger than the approach below. And, more
# importantly, at least Okular is throwing errors (although it seems to be able
# to open it fine).

echo "[Scanner] Scanning to PNG ..."
scanimage > "$pdf_name".png

echo "[Scanner] Converting to uncompressed PDF ..."
convert "$pdf_name".png "$pdf_name"_large.pdf

echo "[Scanner] Compressing PDF ..."
ps2pdf "$pdf_name"_large.pdf "$pdf_name".pdf

printf "[Scanner] Do not want to remove PNG and uncompressed PDF? Then type NO: "
read want_remove
if ! [ "$want_remove" == "NO" ]; then
    echo "[Scanner] Removing unnecessary output ..."
    rm "$pdf_name".png "$pdf_name"_large.pdf
fi
