#!/usr/bin/env bash

log_sign="[uZig]"

echo "$log_sign Starting update ..."
zig_dir=$HOME/bin/zig
mkdir --parents $zig_dir
cd $zig_dir
rm -rf zig*
version="0.13.0" # stick to 0.13.0 for Ghostty 1.1.x
tar_name="zig-linux-x86_64-$version"
curl -Lo zig.tar.xz "https://ziglang.org/download/$version/$tar_name.tar.xz"
tar xf zig.tar.xz
mv "$tar_name" "zig"
echo "$log_sign Finished update."
