#!/bin/bash

echo '  _________  ____  __  __'
echo ' / ___/ __ \/ __ \/ / / /'
echo '/ /__/ /_/ / /_/ / /_/ /'
echo '\___/\____/ .___/\__, /'
echo '         /_/    /____/'
echo

echo 'What?'
echo
what="$(fdfind --hidden --no-ignore --exclude .git --exclude node_modules --exclude env --exclude __pycache__ --type file --type directory . $HOME | fzf --height=10%)"
if [[ $? != 0 ]]; then exit 1; fi

echo 'Where to?'
echo
where="$(fdfind --hidden --no-ignore --exclude .git --exclude node_modules --exclude env --exclude __pycache__ --type directory . $HOME | fzf --height=10%)"
if [[ $? != 0 ]]; then exit 1; fi

cp --recursive "$what" "$where"
