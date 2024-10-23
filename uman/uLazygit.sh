#!/usr/bin/env bash

log_sign="[uLazygit]"

echo "$log_sign Starting update ..."
lazygit_dir=$HOME/bin/lazygit
mkdir -p $lazygit_dir
cd $lazygit_dir
lazygit_version=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${lazygit_version}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
echo "$log_sign Finished update."
