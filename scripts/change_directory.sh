function change_directory {
    echo '            __'
    echo '  _________/ /'
    echo ' / ___/ __  /'
    echo '/ /__/ /_/ /'
    echo '\___/\__,_/'
    echo

    echo "Where to?"

    if [ $# == 0 ]; then
        echo "In $HOME"
        where="$(fdfind --hidden --no-ignore --exclude .git --exclude node_modules --exclude env --exclude __pycache__ --type directory . $HOME | fzf --height=20%)"
    elif [ $# == 1 ]; then
        if [ "$1" == "current_dir" ]; then
            echo "In $PWD"
            where="$(fdfind --hidden --no-ignore --exclude .git --exclude node_modules --exclude env --exclude __pycache__ --type directory . . | fzf --height=20%)"
        elif [ "$1" == "git_repos" ]; then
            echo "In $HOME, but only Git repos"
            where="$(fdfind --hidden --no-ignore --type directory '\.git$' $HOME | xargs dirname | fzf --height=20%)"
        else
            echo "In $HOME, but using \"$1\" as a pattern"
            where="$(fdfind --hidden --no-ignore --exclude .git --exclude node_modules --exclude env --exclude __pycache__ --type directory "$1" $HOME | fzf --height=20%)"
        fi
    fi

    echo "-> $where"
    echo

    cd "$where"

    unset -v where
}
