#!/bin/bash

cd $HOME/.password-store
fdfind --extension gpg . . | sed "s/\.\///" | sed "s/\.gpg//" | fzf --height=10% | xargs pass | xclip -rmlastnl
echo "Clipboard will be cleared and terminal will be closed in 20 seconds ..."
sleep 20
xsel --clear
