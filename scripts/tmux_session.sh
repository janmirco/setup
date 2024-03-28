#!/bin/bash

session_1="1"

if ! tmux has-session -t "$session_1" &> /dev/null; then
    todo_window="todo"
    klog_window="klog"

    tmux new-session -d -s "$session_1" -n "$todo_window" -c "$HOME"
    tmux new-window -n "$klog_window" -c "$HOME"
    tmux new-window -c "$HOME"

    tmux send-keys -t "$session_1":"$todo_window".1 "dlpa" Enter
    tmux send-keys -t "$session_1":"$klog_window".1 "k" Enter
fi

tmux attach-session -t "$session_1"
