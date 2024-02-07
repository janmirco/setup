#!/bin/bash

$EDITOR $(grep --exclude-dir={".git","node_modules","coverage"} -rnl "$1" ./ --include "*.$2")
