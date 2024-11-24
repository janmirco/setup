#!/usr/bin/env bash

echo '   __                                              _'
echo '  / /_____ ___  __  ___  __   ________  __________(_)___  ____'
echo ' / __/ __ `__ \/ / / / |/_/  / ___/ _ \/ ___/ ___/ / __ \/ __ \'
echo '/ /_/ / / / / / /_/ />  <   (__  )  __(__  |__  ) / /_/ / / / /'
echo '\__/_/ /_/ /_/\__,_/_/|_|  /____/\___/____/____/_/\____/_/ /_/'
echo

echo "Where to?"
where="$(fd --hidden --no-ignore-vcs --type directory . $HOME | fzf --height=10%)"
if [[ $? != 0 ]]; then exit 1; fi
echo "-> $where"
echo

function new_window {
    if [[ "$3" != "1" ]]; then
        tmux new-window -t "$1":"$3" -n "$4" -c "$2"
    fi
    tmux rename-window -t "$1":"$3" "$4"
}

function top_bottom {
    new_window "$1" "$2" "$3" "$4"
    tmux split-window -v -c "$2"
    tmux select-pane -t 1
    tmux resize-pane -D 15
    tmux send-keys -t "$1":"$3".1 "$4" Enter
}

function main_split {
    new_window "$1" "$2" "$3" "$4"
    tmux split-window -h -c "$2"
    tmux select-pane -t 2
    tmux split-window -v -c "$2"
    tmux select-pane -t 1
    tmux send-keys -t "$1":"$3".1 "$4" Enter
}

function main_only {
    new_window "$1" "$2" "$3" "$4"
    tmux send-keys -t "$1":"$3".1 "$4" Enter
}

session=$(basename "$where")

if ! tmux has-session -t "$session" &> /dev/null; then
    # Create a new session
    tmux new-session -d -s "$session" -c "$where"

    # Window 1
    window="1"
    program="lazygit"
    main_only "$session" "$where" "$window" "$program"

    # Window 2
    window="2"
    program="yazi"  # make sure to choose this as your selected window, else yazi does not start properly
    main_only "$session" "$where" "$window" "$program"

    # Select specific window
    tmux select-window -t "$session":2
fi

tmux attach-session -t "$session"
