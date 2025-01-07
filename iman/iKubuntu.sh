#!/usr/bin/env bash

# ==============================================================================
#   APT installs

# initial update and upgrade
sudo apt-get update && sudo apt-get upgrade --assume-yes

# apt installs
sudo apt-get install --assume-yes curl xclip tree htop btop ranger figlet sl ncdu ncdt rename libaa-bin lolcat tlp
sudo apt-get install --assume-yes tmux
sudo apt-get install --assume-yes ssh net-tools xorgxrdp xrdp
sudo apt-get install --assume-yes pass xsel
sudo apt-get install --assume-yes fontconfig*
sudo apt-get install --assume-yes calcurse todotxt-cli
sudo apt-get install --assume-yes pandoc librsvg2-*
sudo apt-get install --assume-yes cmatrix*
sudo apt-get install --assume-yes hollywood
sudo apt-get install --assume-yes python3 python3-doc python3-pip python3-venv
sudo apt-get install --assume-yes python3-setuptools python-setuptools-doc python3-dev
sudo apt-get install --assume-yes ipython3 python3-ipykernel
sudo apt-get install --assume-yes lua5.1 luarocks luajit
sudo apt-get install --assume-yes silversearcher-ag
sudo apt-get install --assume-yes doc-base stow
sudo apt-get install --assume-yes cmake make gcc g++ gfortran git build-essential
sudo apt-get install --assume-yes libc++-dev libc-dev*
sudo apt-get install --assume-yes libfmt-dev libfmt-doc
sudo apt-get install --assume-yes csh tcsh ksh
sudo apt-get install --assume-yes libstdc++5 libjpeg62 libmotif-dev
sudo apt-get install --assume-yes clangd libclang-dev
sudo apt-get install --assume-yes gdb cppcheck*
sudo apt-get install --assume-yes indent*
sudo apt-get install --assume-yes octave octave-*
sudo apt-get install --assume-yes gmsh gmsh-doc
sudo apt-get install --assume-yes paraview paraview-dev paraview-doc
sudo apt-get install --assume-yes inkscape gimp ffmpeg imagemagick
sudo apt-get install --assume-yes texlive texlive-lang-german texlive-latex-extra texlive-fonts-extra texlive-science texlive-bibtex-extra biber fontforge fontforge-doc fontforge-extras latexmk
sudo apt-get install --assume-yes texmaker* texstudio* kile*
sudo apt-get install --assume-yes gnuplot gnuplot-doc
sudo apt-get install --assume-yes mupdf*
sudo apt-get install --assume-yes pdftk*
sudo apt-get install --assume-yes doxygen doxygen-latex doxygen-doc
sudo apt-get install --assume-yes libblas-dev liblapack-dev
sudo apt-get install --assume-yes libatlas-base-dev
sudo apt-get install --assume-yes openmpi-bin openmpi-common openmpi-doc libopenmpi-dev
sudo apt-get install --assume-yes libhdf5-dev libhdf5-openmpi-dev
sudo apt-get install --assume-yes trilinos-* libtrilinos-kokkos-* libtrilinos-sacado-*
sudo apt-get install --assume-yes petsc* libpetsc*
sudo apt-get install --assume-yes liboce-*  # opencascade
sudo apt-get install --assume-yes libp4est-*
sudo apt-get install --assume-yes scalapack-* libscalapack-*
sudo apt-get install --assume-yes libboost*
sudo apt-get install --assume-yes libgmp-dev libbinutils libbinutils-dbg
sudo apt-get install --assume-yes sqlite3 libsqlite3-dev sqlite3-doc
sudo apt-get install --assume-yes vim vim-runtime vim-doc vim-scripts vim-gtk3
sudo apt-get install --assume-yes obs-studio
sudo apt-get install --assume-yes pugixml-doc libpugixml*
sudo apt-get install --assume-yes kdenlive*
sudo apt-get install --assume-yes default-jre default-jdk
sudo apt-get install --assume-yes remmina*
sudo apt-get install --assume-yes jq
sudo apt-get install --assume-yes libxcb-xinerama0 libxcb-cursor0 lsb-core
sudo apt-get install --assume-yes libgtk-4-dev libadwaita-1-dev
sudo apt-get install --assume-yes gcc-multilib
sudo apt-get install --assume-yes rofi*
sudo apt-get install --assume-yes evolution evolution-ews
sudo apt-get install --assume-yes hunspell hunspell-en-us hunspell-de-de

# Nvidia installs
#     sudo apt-get install --assume-yes nvidia-settings
#     sudo ubuntu-drivers autoinstall

# Manual APT installs
#
# Downloads:
#
# - https://zoom.us/download
# - https://code.visualstudio.com/download
# - https://obsidian.md/download
# - https://www.virtualbox.org/wiki/Linux_Downloads
#
# Commands:
#
#     sudo apt-get update && sudo apt-get upgrade --assume-yes
#     sudo apt-get install --assume-yes ~/Downloads/zoom_amd64.deb
#     sudo apt-get install --assume-yes ~/Downloads/code_<VERSION>_amd64.deb
#     sudo apt-get install --assume-yes ~/Downloads/obsidian_<VERSION>_amd64.deb
#     sudo apt-get install --assume-yes ~/Downloads/virtualbox-7.0_7.0.20-163906~Ubuntu~jammy_amd64.deb

# Brave
if ! command -v brave-browser &> /dev/null; then
    sudo apt-get update
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    sudo apt-get update
    sudo apt-get install --assume-yes brave-browser
fi

# final update and upgrade
sudo apt-get update && sudo apt-get upgrade --assume-yes

# ==============================================================================
#   Snap installs

sudo snap refresh
sudo snap install chromium  # chromium will be set as default --> manually change back to firefox
sudo snap install chromium-ffmpeg
sudo snap install jabref
sudo snap install spotify
sudo snap install ticktick
sudo snap refresh

# ==============================================================================
#   Flatpak installs

# See: https://flathub.org/setup/Kubuntu
#
# Commands:
#
#     sudo apt-get install --assume-yes flatpak plasma-discover-backend-flatpak
#     sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
#     sudo reboot
#     sudo flatpak install flathub org.gnome.World.PikaBackup
#     sudo flatpak update

# ==============================================================================
#   Fix: NTFS drives only mounting using sudo

# On Kubuntu 24.04, automatic mounting is not working properly for NTFS drives.
# To fix this problem, run the following command to disable `ntfs3` and reboot your system.
#
#     echo 'blacklist ntfs3' | sudo tee /etc/modprobe.d/disable-ntfs3.conf
#
# Afterwards, you can go into your system settings and enable automatic mounting for your removable devices.
