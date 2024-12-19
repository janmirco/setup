#!/usr/bin/env bash

echo '       ___ ________'
echo '  ____/ (_) __/ __/'
echo ' / __  / / /_/ /_'
echo '/ /_/ / / __/ __/'
echo '\__,_/_/_/ /_/'
echo

echo "Left?"
left="$(fd --hidden --no-ignore-vcs $MY_FZF_EXCLUDES --type file . $HOME | fzf --height=10%)"
if [[ $? != 0 ]]; then exit 1; fi
echo "-> $left"
echo

echo "Right?"
right="$(fd --hidden --no-ignore-vcs $MY_FZF_EXCLUDES --type file . $HOME | fzf --height=10%)"
if [[ $? != 0 ]]; then exit 1; fi
echo "-> $right"
echo

$EDITOR -d "$left" "$right"
