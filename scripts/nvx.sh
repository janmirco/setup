#!/usr/bin/env bash

$EDITOR $(fd --hidden --no-ignore-vcs $MY_FZF_EXCLUDES --type file "$1"$)
