#!/bin/bash

file_name="$(find ~/ -type f -not -path "*/\.git*" -not -path "*/node_modules*" | fzf --preview "bat --style=numbers --color=always --line-range :500 {}")"

if ! [ "$file_name" == "" ]; then
    $EDITOR "$file_name"
fi

unset -v file_name
