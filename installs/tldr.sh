#!/bin/bash

# update tldr repo - DO NOT RUN AS ROOT!
cd "$HOME"/.local/share/tldr/tldr && git pull ; cd -
