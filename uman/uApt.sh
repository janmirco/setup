#!/usr/bin/env bash

log_sign="[uApt]"

echo "$log_sign Starting update & upgrade ..."
sudo apt-get update && sudo apt-get upgrade --assume-yes
echo "$log_sign Finished update & upgrade."
