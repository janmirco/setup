#!/bin/bash

log_sign="[uFonts]"
echo "$log_sign Starting update ..."

font=JetBrainsMonoNerdFont
fonts_dir=$HOME/.local/share/fonts/$font
mkdir --parents "$fonts_dir"

styles=(Regular Bold Italic BoldItalic)
for style in "${styles[@]}"; do
    echo "$log_sign Downloading $font-$style ..."
    url="https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/$style/$font-$style.ttf"
    curl --silent --location "$url" --output "$fonts_dir/$font-$style.ttf"
done

echo "$log_sign Erasing all existing cache files and starting rescan ..."
fc-cache --really-force > /dev/null

echo "$log_sign Finished update."
