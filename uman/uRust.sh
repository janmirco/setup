#!/usr/bin/env bash

log_sign="[uRust]"

# See installed crates using: cargo install --list

echo "$log_sign Starting update ..."
rustup update
cargo install bat --locked
cargo install du-dust
cargo install eza
cargo install fd-find
cargo install git-delta
cargo install hayagriva --features cli  # bibliography management for typst
cargo install jj-cli --locked --bin jj
cargo install just
cargo install nu --locked
cargo install presenterm --locked
cargo install resvg
cargo install ripgrep
cargo install rustlings
cargo install sd
cargo install starship --locked
cargo install stylua
cargo install tokei
cargo install tree-sitter-cli
cargo install typst-cli --locked
cargo install typstyle --locked
cargo install viu
# cargo install --force yazi-build  # forces reinstall each time
cargo install zoxide --locked
echo "$log_sign Finished update."
