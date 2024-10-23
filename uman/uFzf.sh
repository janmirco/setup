#!/usr/bin/env bash

bin_name="fzf"
version="0.54.0"
log_sign="[uFzf]"
bin_path="$HOME/bin/$bin_name"
dir_name="$bin_name-linux_amd64"
tar_name="$bin_name-$version-linux_amd64.tar.gz"

function download {
    url="$1"
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
}

download "https://github.com/junegunn/$bin_name/releases/download/v$version/$tar_name"
echo "$log_sign Finished update."
