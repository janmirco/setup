#!/usr/bin/env bash

# PyVista - Notched specimen
width="4200"
height="1580"
x_pos="970"
y_pos="1510"

# # PyVista - Scale
# width="3700"
# height="190"
# x_pos="2142"
# y_pos="4196"

name=$(basename $1 .png)
convert "$name".png \
    -strip \
    -crop "$width"x"$height"+"$x_pos"+"$y_pos" \
    "$name"_cropped.png
