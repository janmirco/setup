#!/usr/bin/env bash

log_sign="[uZig]"

echo "$log_sign Starting update ..."
zig_dir=$HOME/bin/zig
mkdir --parents $zig_dir
cd $zig_dir
rm -rf zig*
version="0.14.0"
curl -Lo zig.tar.xz "https://ziglang.org/download/$version/zig-linux-x86_64-$version.tar.xz"
tar xf zig.tar.xz
mv "zig-linux-x86_64-$version" "zig"
echo "$log_sign Finished update."
