#!/bin/bash

bin_name="slicer"
version="5.6.2"
log_sign="[uSlicer]"
bin_path="$HOME/bin/$bin_name"
dir_name="$bin_name-linux_amd64"
tar_name="$dir_name.tar.gz"
exe_path="$bin_path/$bin_name-linux-amd64"

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
    mv "$bin_path/Slicer-$version-linux-amd64" "$exe_path"

    echo "$log_sign Create softlink ..."
    ln --symbolic "$exe_path/Slicer" "$exe_path/slicer"
}

download "https://download.slicer.org/bitstream/660f92ed30e435b0e355f1a4"
echo "$log_sign Finished update."
