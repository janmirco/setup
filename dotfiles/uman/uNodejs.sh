#!/bin/bash

bin_name="nodejs"
log_sign="[uNodejs]"
bin_path="$HOME/bin/$bin_name"
dir_name="$bin_path/node-linux-x64"

echo "$log_sign Current version: "$(node --version)""
version="$(curl --silent --location https://nodejs.org/en/download/ | sed 's/Latest LTS Version<!-- -->: <strong>/\n/' | head -n 2 | tail -n 1 | sed 's/<\/strong>/\n/' | head -n 1)"
echo "$log_sign New version: $version"

tar_name="$bin_path/node-v$version-linux-x64.tar.gz"

function download {
    url="$1"
    if $(curl --silent --head --fail "$url" --output /dev/null); then
        echo "$log_sign Starting update ..."

        if ! [ -d "$bin_path" ]; then
            echo "$log_sign Creating directory in ~/bin/ ..."
            mkdir -p "$bin_path"
        fi
        if [ -d "$dir_name" ]; then
            echo "$log_sign Removing old version ..."
            rm -rf "$dir_name"
        fi

        echo "$log_sign Removing old tar ..."
        rm -r "$bin_path"/*.tar.gz

        echo "$log_sign Downloading new version ..."
        curl -L "$url" --output "$tar_name" > "$bin_path/$bin_name"_log.txt 2>&1

        echo "$log_sign Extracting tar ..."
        tar -C "$bin_path" -xvzf "$tar_name" >> "$bin_path/$bin_name"_log.txt 2>&1

        echo "$log_sign Removing version from dir name ..."
        mv "$bin_path/node-v$version-linux-x64" "$bin_path/node-linux-x64"

        echo "$log_sign Updating npm ..."
        npm install -g npm >> "$bin_path/$bin_name"_log.txt 2>&1

        echo "$log_sign Updating npm provider for neovim ..."
        npm install -g neovim >> "$bin_path/$bin_name"_log.txt 2>&1

        echo "$log_sign Updating yarn ..."
        npm install -g yarn >> "$bin_path/$bin_name"_log.txt 2>&1

        echo "$log_sign Wrote stdout and stderr to "$bin_path/$bin_name"_log.txt."
    else
        echo "$log_sign Given URL not found!"
    fi
}

download "https://$bin_name.org/dist/v$version/node-v$version-linux-x64.tar.gz"
echo "$log_sign Finished update."
