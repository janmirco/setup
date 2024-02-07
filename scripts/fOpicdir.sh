#!/bin/bash

dir_name="$(find ./ -type d -not -path "*/\.git*" -not -path "*/node_modules*" | fzf --preview "bat --style=numbers --color=always --line-range :500 {}")"

if ! [ "$dir_name" == "" ]; then
    sxiv -t "$dir_name"/*
fi

unset -v file_name
