#!/usr/bin/env bash

log_sign="[uStarship]"

echo "$log_sign Starting update ..."
cargo install starship --locked
echo "$log_sign Finished update."
