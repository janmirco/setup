#!/usr/bin/env bash

directory="."
if [[ "$1" != "" ]]; then
    directory="$1"
fi
chosen_file="$(fdfind --hidden --no-ignore --exclude .git --exclude node_modules --exclude env --exclude __pycache__ --type file . $directory | fzf --height=75% --preview 'batcat --style=numbers --color=always {}')"
if [[ $? != 0 ]]; then
    exit 1
fi
if [[ "$2" == "xdg" ]]; then
    xdg-open "$chosen_file"
else
    $EDITOR "$chosen_file"
fi
