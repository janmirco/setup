#!/usr/bin/env bash

# set defaults
image_ext="tif"
width="600"
height="600"

# override defaults
echo "Do you want to crop with defaults? Press ENTER."
echo "    - Image extension: $image_ext"
echo "    - Width: $width"
echo "    - Height: $height"
echo "If not, type N (or anything else) and press ENTER."
read defaults
if [[ "$defaults" != "" ]]; then
    printf "    - Image extension: "
    read image_ext
    printf "    - Width: "
    read width
    printf "    - Height: "
    read height
fi

# crop images and move to separate directory
for image in *."$image_ext"; do
    image_name=$(basename "$image" ."$image_ext")
    echo "Crop $image_name ..."
    convert "$image_name"."$image_ext" -crop "$width"x"$height"+0+0 "$image_name"_cropped."$image_ext"
done
echo "Remove old cropped directory ..."
rm --recursive --force cropped
echo "Create new cropped directory ..."
mkdir --parents cropped
echo "Move cropped images into separate directory ..."
mv *_cropped."$image_ext" cropped
