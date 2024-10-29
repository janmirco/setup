#!/usr/bin/env bash

bin_name="marp"
log_sign="[uMarp]"
bin_path="$HOME/bin/$bin_name"

# find new version number
echo "$log_sign Current version: "$(marp --version)""
version="$(curl --silent --location https://github.com/marp-team/marp-cli/tags/)"
if [[ "$version" =~ v[0-9]\.[0-9]\.[0-9]? ]]; then
    version="${BASH_REMATCH[0]}"
else
    echo "Did not find any version!"
    exit 1
fi
echo "$log_sign New version: $version"

tar_name="marp-cli-$version-linux.tar.gz"

function download {
    url="$1"
    if $(curl --silent --head --fail "$url" --output /dev/null); then
        echo "$log_sign Starting update ..."

        if ! [ -d "$bin_path" ]; then
            echo "$log_sign Creating directory in ~/bin/ ..."
            mkdir -p "$bin_path"
        fi
        if [ -f "$bin_path/$bin_name" ]; then
            echo "$log_sign Removing old version ..."
            rm -rf "$bin_path/$bin_name"
        fi
        if [ -f "$bin_path/$tar_name" ]; then
            echo "$log_sign Removing old tar ..."
            rm -rf "$bin_path/$tar_name"
        fi

        echo "$log_sign Downloading new version ..."
        curl -L "$url" --output "$bin_path/$tar_name"

        echo "$log_sign Extracting tar ..."
        tar -C "$bin_path" -xzf "$bin_path/$tar_name"
    else
        echo "$log_sign Given URL not found!"
    fi
}

download "https://github.com/marp-team/marp-cli/releases/download/$version/$tar_name"
echo "$log_sign Finished update."
