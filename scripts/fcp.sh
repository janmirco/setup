#!/usr/bin/env bash

echo '  _________  ____  __  __'
echo ' / ___/ __ \/ __ \/ / / /'
echo '/ /__/ /_/ / /_/ / /_/ /'
echo '\___/\____/ .___/\__, /'
echo '         /_/    /____/'
echo

echo "What?"
what="$(fd --hidden --no-ignore-vcs $MY_FZF_EXCLUDES --type file --type directory . $HOME | fzf --height=10%)"
if [[ $? != 0 ]]; then exit 1; fi
echo "-> $what"
echo

echo "Where to?"
where="$(fd --hidden --no-ignore-vcs $MY_FZF_EXCLUDES --type directory . $HOME | fzf --height=10%)"
if [[ $? != 0 ]]; then exit 1; fi
echo "-> $where"
echo

cp --recursive "$what" "$where"
