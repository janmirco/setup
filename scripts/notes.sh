#!/bin/bash

echo "                __"
echo "   ____  ____  / /____  _____"
echo "  / __ \/ __ \/ __/ _ \/ ___/"
echo " / / / / /_/ / /_/  __(__  )"
echo "/_/ /_/\____/\__/\___/____/"
echo

# find all git repos in home
chosen_git_repo="$(fdfind --hidden --no-ignore --type directory '\.git$' $HOME | xargs dirname | fzf --height=10%)"

# check for error in last command
if [[ $? != 0 ]]; then
    exit 1
fi

# make sure notes directory exists
mkdir -p "$chosen_git_repo/notes"

# open note using current date as part of file name
$EDITOR "$chosen_git_repo/notes/$(date +%Y-%m-%d)_note.md"
