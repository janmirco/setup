#!/usr/bin/env bash

directory="."
if [[ "$1" != "" ]]; then
    directory="$1"
fi
if [[ "$3" != "" ]]; then
    file_extension="$3"
    chosen_file="$(fd --hidden --no-ignore-vcs $MY_FZF_EXCLUDES --extension $file_extension --type file . $directory | fzf --height=75% --preview 'bat --style=numbers --color=always {}')"
else
    chosen_file="$(fd --hidden --no-ignore-vcs $MY_FZF_EXCLUDES                             --type file . $directory | fzf --height=75% --preview 'bat --style=numbers --color=always {}')"
fi
if [[ $? != 0 ]]; then
    exit 1
fi
if [[ "$2" == "xdg" ]]; then
    xdg-open "$chosen_file"
else
    $EDITOR "$chosen_file"
fi
