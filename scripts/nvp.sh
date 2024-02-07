#!/bin/bash

export EDITOR_FULL_LSP_POWER="yes"
$EDITOR "$@"
unset -v EDITOR_FULL_LSP_POWER
