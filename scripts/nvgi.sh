#!/usr/bin/env bash

$EDITOR $(grep --exclude-dir={".git","node_modules","coverage"} -rnil "$1" ./)
