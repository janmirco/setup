#!/bin/bash

log_sign="[uSnap]"

echo "$log_sign Starting update ..."
sudo snap refresh
echo "$log_sign Finished update."
