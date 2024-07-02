#!/usr/bin/env bash

current_dir="$(pwd)"
for pdf_file in $(ls "$current_dir"/*.pdf); do
    $HOME/scripts/greppdf.sh "$pdf_file" "$1"
done
