#!/bin/bash

$EDITOR $(find ./ -type d \( -name ".git" -o -name "node_modules" -o -name "coverage" \) -prune -false -o -type f -name "*$1*")
