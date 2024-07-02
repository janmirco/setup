#!/usr/bin/env bash

if [[ "$1" == "" ]]; then
    echo "Open all files? Press Enter!"
    read sure
    if [[ "$sure" == "" ]]; then
        for file in ./*; do
            xdg-open "$file"
        done
    fi
elif [[ "$1" == "pdf" ]]; then
    echo "Open all PDFs? Press Enter!"
    read sure
    if [[ "$sure" == "" ]]; then
        for file in ./*.pdf; do
            xdg-open "$file"
        done
    fi
else
    for file in "$@"; do
        xdg-open "$file"
    done
fi
