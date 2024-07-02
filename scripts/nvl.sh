#!/usr/bin/env bash

export EDITOR_LIGHT="yes"
$EDITOR "$@"
unset -v EDITOR_LIGHT
