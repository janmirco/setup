#!/usr/bin/env bash

if [ "$1" == "" ]; then
    echo "$(xclip -o)" > note_"$(date +%Y-%m-%d_%H%M%S)".txt
else
    echo "$(xclip -o)" > "$1".txt
fi
