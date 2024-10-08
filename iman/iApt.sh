#!/bin/bash

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
sudo apt-get install --assume-yes ipython3
sudo apt-get install --assume-yes lua5.1 luarocks
sudo apt-get install --assume-yes fzf ripgrep silversearcher-ag fd-find bat
sudo apt-get install --assume-yes doc-base stow
sudo apt-get install --assume-yes cmake make gcc g++ gfortran git build-essential
sudo apt-get install --assume-yes libc++-dev libc-dev*
sudo apt-get install --assume-yes libfmt-dev libfmt-doc
sudo apt-get install --assume-yes csh tcsh ksh
sudo apt-get install --assume-yes libstdc++5 libjpeg62 libmotif-dev
sudo apt-get install --assume-yes clangd clangd-14 libclang-14-dev
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

# Install virtualbox in a separate window because of license agreement
# sudo apt-get install --assume-yes virtualbox virtualbox-ext-pack
#
# If there are problems with virtualbox, installing the newest version might help.
# Download: https://www.virtualbox.org/wiki/Linux_Downloads
# Then:
#     - sudo apt-get update && sudo apt-get upgrade
#     - sudo apt-get remove virtualbox virtualbox-dkms virtualbox-ext-pack virtualbox-qt
#     - sudo apt-get install ~/Downloads/virtualbox-7.0_7.0.20-163906~Ubuntu~jammy_amd64.deb

# Some installs via flatpak.
#     See: https://flathub.org/setup/Kubuntu
#     Run:
#         sudo apt-get install --assume-yes flatpak plasma-discover-backend-flatpak
#         flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
#         sudo reboot
#     Install:
#         flatpak install flathub org.gnome.World.PikaBackup
#     If no icon or no desktop entry, see https://github.com/alacritty/alacritty/blob/master/INSTALL.md#desktop-entry and do, e.g., for icon:
#         sudo cp /var/lib/flatpak/app/org.gnome.World.PikaBackup/current/active/export/share/icons/hicolor/scalable/apps/org.gnome.World.PikaBackup.svg /usr/share/pixmaps/

# Some installs via .deb packages.
#     Download from:
#         - https://zoom.us/download
#         - https://code.visualstudio.com/download
#         - https://obsidian.md/download
#         - https://www.microsoft.com/en-us/edge/download
#     Install:
#         sudo apt-get update && sudo apt-get upgrade --assume-yes
#         sudo apt-get install --assume-yes ~/Downloads/zoom_amd64.deb
#         sudo apt-get install --assume-yes ~/Downloads/code_<VERSION>_amd64.deb
#         sudo apt-get install --assume-yes ~/Downloads/obsidian_<VERSION>_amd64.deb
#         sudo apt-get install --assume-yes ~/Downloads/microsoft-edge-stable_<VERSION>_amd64.deb

# Brave
if ! command -v brave-browser &> /dev/null; then
    sudo apt-get update
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    sudo apt-get update
    sudo apt-get install --assume-yes brave-browser
fi

# Sciebo
if ! command -v sciebo &> /dev/null; then
    sudo apt-get update
    sudo apt-get install --assume-yes libicu70 libzstd1 apt-transport-https
    wget -nv https://install.sciebo.de/linux/Ubuntu_22.04/Release.key -O - | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sciebo-client.gpg > /dev/null
    echo 'deb https://install.sciebo.de/linux/Ubuntu_22.04/ /' | sudo tee -a /etc/apt/sources.list.d/sciebo-client.list
    sudo apt-get update
    sudo apt-get install --assume-yes sciebo-client sciebo-client-*
fi

# Pulse/Ivanti vpn problem, see https://zim.uni-wuppertal.de/de/unsere-dienste/netzzugang/vpn-aussenzugang/pulse-secure/#c135068
if ! [ -f '/etc/apt/sources.list.d/home:bluca:openconnect.list' ]; then
    echo 'deb http://download.opensuse.org/repositories/home:/bluca:/openconnect/Ubuntu_22.04/ /' | sudo tee /etc/apt/sources.list.d/home:bluca:openconnect.list
    curl -fsSL https://download.opensuse.org/repositories/home:bluca:openconnect/Ubuntu_22.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_bluca_openconnect.gpg > /dev/null
    sudo apt-get update
    sudo apt-get install --assume-yes openconnect network-manager-openconnect
    sudo apt-get install --assume-yes network-manager network-manager-config-connectivity-ubuntu network-manager-dev network-manager-fortisslvpn network-manager-gnome network-manager-iodine network-manager-l2tp network-manager-l2tp-gnome network-manager-openconnect network-manager-openvpn network-manager-pptp network-manager-ssh network-manager-sstp network-manager-strongswan network-manager-vpnc
fi

# final update and upgrade
sudo apt-get update && sudo apt-get upgrade --assume-yes
