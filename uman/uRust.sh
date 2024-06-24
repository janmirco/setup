#!/bin/bash

log_sign="[uRust]"

# See installed crates using: cargo install --list

echo "$log_sign Starting update ..."
cargo install alacritty
cargo install --locked bat
cargo install eza
cargo install git-delta
cargo install stylua
cargo install tokei
cargo install tree-sitter-cli
cargo install --locked yazi-fm yazi-cli
echo "$log_sign Finished update."
