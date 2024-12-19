#!/usr/bin/env bash

echo "                __"
echo "   ____  ____  / /____  _____"
echo "  / __ \/ __ \/ __/ _ \/ ___/"
echo " / / / / /_/ / /_/  __(__  )"
echo "/_/ /_/\____/\__/\___/____/"
echo

# find all dirs in home
chosen_git_repo="$(fd --hidden --no-ignore $MY_FZF_EXCLUDES --type directory . $HOME | fzf --height=10%)"

# check for error in last command
if [[ $? != 0 ]]; then
    exit 1
fi

# open note using current date as part of file name
$EDITOR "$chosen_git_repo/$(date +%Y-%m-%d).md"
