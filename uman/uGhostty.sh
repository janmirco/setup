#!/usr/bin/env bash

log_sign="[uGhostty]"

# Dependencies:
#   - Zig 0.14
#   - `sudo apt-get install libgtk-4-dev libadwaita-1-dev git gettext libxml2-utils`
#   - `sudo snap install blueprint-compiler --classic`  # because newer version is necessary
#   - Build `libgtk4-layer-shell-dev` from source because newer version is necessary. See here: https://github.com/wmww/gtk4-layer-shell
#
# Notes:
#   - Although newest build works with newly installed dependencies, switching back to older version of Ghostty because of weird flash when splitting and missing dim for unfocused split.
#   - Stick to Zig 0.13.0 and Ghostty 1.1.x
#
# See:
#   - https://ghostty.org/docs/install/build

echo "$log_sign Starting update ..."
cd $HOME/github/ghostty-org/ghostty
ghostty +version |& tee latest_working_version.txt
git pull
zig build -p $HOME/.local -Doptimize=ReleaseFast
echo "$log_sign Finished update."
