#!/usr/bin/env bash

log_sign="[uTldr]"

echo "$log_sign Starting update ..."
tldr --update_cache
echo "$log_sign Finished update."
