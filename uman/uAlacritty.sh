#!/usr/bin/env bash

log_sign="[uAlacritty]"

echo "$log_sign Starting update ..."
cargo install alacritty@0.13.2
echo "$log_sign Finished update."
