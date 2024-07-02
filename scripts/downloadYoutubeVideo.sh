#!/usr/bin/env bash

# check if first argument is empty
if [ "$1" == "" ]; then
    echo ">> No URL or YouTube code was given!"
    exit
fi

url="$1"
yt-dlp --list-formats $url
printf ">> Enter format code: "
read format_code
yt-dlp --format  $format_code $url

unset -v format_code url
