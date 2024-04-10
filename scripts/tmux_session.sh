#!/bin/bash

session="$(date +%Y-%m-%d)"

if ! tmux has-session -t "$session" &> /dev/null; then
    window="TODO"
    tmux new-session -d -s "$session" -n "$window" -c "$HOME"
    tmux send-keys -t "$session":"$window".1 "dlpa" Enter

    window="KLOG"
    tmux new-window -n "$window" -c "$HOME"
    tmux send-keys -t "$session":"$window".1 "k" Enter

    tmux new-window -c "$HOME"
fi

tmux attach-session -t "$session"
