function change_directory {
    echo '            __'
    echo '  _________/ /'
    echo ' / ___/ __  /'
    echo '/ /__/ /_/ /'
    echo '\___/\__,_/'
    echo

    echo "Where to?"

    if [ $# == 0 ]; then
        where="$(fdfind --hidden --no-ignore --exclude .git --exclude node_modules --exclude env --exclude __pycache__ --type directory . $HOME | fzf --height=10%)"
    elif [ $# == 1 ]; then
        where="$(fdfind --hidden --no-ignore --exclude .git --exclude node_modules --exclude env --exclude __pycache__ --type directory "$1" $HOME | fzf --height=10%)"
    fi

    echo "-> $where"
    echo

    cd "$where"

    unset -v where
}
