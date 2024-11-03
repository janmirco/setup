#!/usr/bin/env bash

log_sign="[uRust]"

# See installed crates using: cargo install --list

echo "$log_sign Starting update ..."
rustup update
cargo install alacritty@0.13.2
cargo install bat --locked
cargo install du-dust
cargo install eza
cargo install fd-find
cargo install git-delta
cargo install ripgrep
cargo install starship --locked
cargo install stylua
cargo install tokei
cargo install tree-sitter-cli
cargo install yazi-fm yazi-cli --locked
echo "$log_sign Finished update."
