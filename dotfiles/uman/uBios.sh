#!/bin/bash

log_sign="[uBios]"

# list updates with `fwupdmgr get-updates`
echo "$log_sign Starting update ..."
fwupdmgr update
