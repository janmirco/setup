#!/usr/bin/env bash

bin_name="odin"
month="2024-12"
version="dev-$month"
log_sign="[uOdin]"
bin_path="$HOME/bin/$bin_name"
dir_name="$bin_name-linux-amd64"
tar_name="$dir_name-$version.tar.gz"
url="https://github.com/odin-lang/Odin/releases/download/$version/$tar_name"
nightly_name="$dir_name-nightly+$month-05"

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

    echo "$log_sign Rename dir ..."
    mv "$nightly_name" "$dir_name"
}

download "$url"
echo "$log_sign Finished update."
