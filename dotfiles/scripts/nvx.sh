#!/bin/bash

$EDITOR $(find ./ -type d \( -name ".git" -o -name "node_modules" -o -name ".eggs" -o -name ".pytest_cache" -o -name "*.eggs" -o -name "coverage" \) -prune -false -o -type f -name "*.$1")
