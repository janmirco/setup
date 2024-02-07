#!/bin/bash

exp_dir="$HOME/.calcurse/exports"
ics_file="$exp_dir/calcurse_$(date +%Y-%m-%d_%H%M%S).ics"

# export ics file
echo "[Calcurse] Exporting appointments ..."
calcurse --export > "$ics_file"

# add reminder time in minutes
time=30
echo "[Calcurse] Adding a reminder of "$time"min to every appointment ..."
sed -i "/SUMMARY/a BEGIN:VALARM" "$ics_file"
sed -i "/BEGIN:VALARM/a ACTION:DISPLAY" "$ics_file"
sed -i "/ACTION:DISPLAY/a DESCRIPTION:REMINDER" "$ics_file"
sed -i "/DESCRIPTION:REMINDER/a TRIGGER:-PT"$time"M" "$ics_file"
sed -i "/TRIGGER:-PT"$time"M/a END:VALARM" "$ics_file"

# prepare cleanup
function cleanup() {
    echo "[Calcurse] Close file sharing in $exp_dir ..."
    make close
    echo "[Calcurse] Show firewall status ..."
    make status
}

# share directory with local network
echo "[Calcurse] cd into $exp_dir ..."
cd "$exp_dir"
trap cleanup EXIT
echo "[Calcurse] Start sharing files in $exp_dir ..."
make
