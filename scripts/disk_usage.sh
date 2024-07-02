#!/usr/bin/env bash

dir="$([ "$1" == "" ] && echo "." || echo "$1")"
du --human-readable --max-depth=1 "$dir" | sort --human-numeric-sort --reverse
unset -v dir
