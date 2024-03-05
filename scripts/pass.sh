#!/bin/bash

echo '    ____  ____ ___________'
echo '   / __ \/ __ `/ ___/ ___/'
echo '  / /_/ / /_/ (__  |__  )'
echo ' / .___/\__,_/____/____/'
echo '/_/'
echo

cd $HOME/.password-store
fdfind --extension gpg . . | sed "s/\.\///" | sed "s/\.gpg//" | fzf --height=10% | xargs pass | xclip -rmlastnl
echo "Clipboard will be cleared and terminal will be closed in 20 seconds ..."
sleep 20
xsel --clear
