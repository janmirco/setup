#!/usr/bin/env bash

log_sign="[uFlatpak]"

echo "$log_sign Starting update ..."
sudo flatpak update
echo "$log_sign Finished update."
