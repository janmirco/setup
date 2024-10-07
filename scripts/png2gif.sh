#!/usr/bin/env bash

# convert -delay 5 -loop 0 -dispose Background liquid*.png liquid_sloshing.gif
# convert -delay 2 -loop 0 "$1" output.gif

# ffmpeg -i %03d_$1.png -vf palettegen palette.png
# ffmpeg -framerate 10 -i %03d_$1.png -i palette.png -filter_complex "paletteuse" output.gif

fps=2
# ffmpeg -framerate "$fps" -i %03d_"$1".png -i palette.png -filter_complex "paletteuse" output_"$fps"fps.mp4

# windows_options='-c:v libx264 -profile:v high -level:v 4.0 -pix_fmt yuv420p -crf 23 -c:a aac -b:a 128k -movflags +faststart'
# ffmpeg -i output_"$fps"fps.mp4 -c:v libx264 -profile:v high -level:v 4.0 -pix_fmt yuv420p -crf 23 -c:a aac -b:a 128k -movflags +faststart output_"$fps"fps_win.mp4
ffmpeg -framerate "$fps" -i %03d_"$1".png -i palette.png -filter_complex "paletteuse" -c:v libx264 -profile:v high -level:v 4.0 -pix_fmt yuv420p -crf 23 -c:a aac -b:a 128k -movflags +faststart output_"$fps"fps_win.mp4
