#!/usr/bin/env bash

# gource --frameless -f --start-date "2021-03-28 06:00"
gource --frameless --seconds-per-day 0.1

# uncompressed VERY big file:
# gource --frameless --start-date "2021-03-28 06:00" --output-ppm-stream mini_thesis_history.mp4

# compress created mp4 file with:
# ffmpeg -i mini_thesis_history.mp4 mini_thesis_history_compressed.mp4
