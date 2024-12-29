#!/usr/bin/env bash

log_sign="[uGhostty]"

# Dependencies:
#   - Zig 0.13
#   - `sudo apt-get install libgtk-4-dev libadwaita-1-dev git`
#
# See:
#   - https://ghostty.org/docs/install/build

echo "$log_sign Starting update ..."
cd $HOME/github/ghostty-org/ghostty
git pull
zig build -p $HOME/.local -Doptimize=ReleaseFast
echo "$log_sign Finished update."
