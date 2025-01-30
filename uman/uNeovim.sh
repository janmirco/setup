#!/usr/bin/env bash

bin_name="neovim"
log_sign="[uNeovim]"
bin_path="$HOME/bin/$bin_name"
dir_name="nvim-linux-x86_64"
tar_name="$dir_name.tar.gz"

function download {
    url="$1"
    if $(curl --silent --head --fail "$url" --output /dev/null); then
        echo "$log_sign Starting update ..."

        if ! [ -d "$bin_path" ]; then
            echo "$log_sign Creating directory in ~/bin/ ..."
            mkdir -p "$bin_path"
        fi
        if [ -d "$bin_path/$dir_name" ]; then
            echo "$log_sign Removing old version ..."
            rm -rf "$bin_path/$dir_name"
        fi
        if [ -f "$bin_path/$tar_name" ]; then
            echo "$log_sign Removing old tar ..."
            rm -rf "$bin_path/$tar_name"
        fi

        echo "$log_sign Downloading new version ..."
        curl -L "$url" --output "$bin_path/$tar_name"

        echo "$log_sign Extracting tar ..."
        tar -C "$bin_path" -xzf "$bin_path/$tar_name"

        echo "$log_sign Updating python-provider ..."
        uv tool install pynvim

        echo "$log_sign Updating tree-sitter-cli ..."
        cargo install tree-sitter-cli
    else
        echo "$log_sign Given URL for nightly build not found! Trying latest stable version ..."
        download "https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz"
    fi
}

download "https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz"
echo "$log_sign Finished update."
