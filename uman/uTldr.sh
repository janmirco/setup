#!/usr/bin/env bash

log_sign="[uTldr]"

echo "$log_sign Starting update ..."
uv tool install tldr
tldr --update
echo "$log_sign Finished update."
