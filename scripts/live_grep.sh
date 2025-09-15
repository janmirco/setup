#!/usr/bin/env bash

chosen_file="$(fzf --height=75% --disabled --bind 'change:reload:rg -i --files-with-matches {q} || true' --preview 'bat --style=numbers --color=always {} | rg -i --color=always --ignore-case --context 1001 {q} || bat --style=numbers --color=always {}')"
if [[ $? != 0 ]]; then
    exit 1
fi
$EDITOR "$chosen_file"
