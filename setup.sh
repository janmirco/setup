#!/bin/bash

# initial update and upgrade
sudo apt-get update && sudo apt-get upgrade

# apt installs
sudo apt-get install --assume-yes curl xclip tree htop ranger figlet sl ncdu ncdt rename
sudo apt-get install --assume-yes tmux
sudo apt-get install --assume-yes ssh
sudo apt-get install --assume-yes pass
sudo apt-get install --assume-yes tldr && cd "$HOME"/.local/share/tldr/tldr && git pull ; cd -
sudo apt-get install --assume-yes calcurse
sudo apt-get install --assume-yes pandoc
sudo apt-get install --assume-yes cmatrix*
sudo apt-get install --assume-yes hollywood
sudo apt-get install --assume-yes python3 python3-doc python3-pip
sudo apt-get install --assume-yes python3-setuptools python-setuptools-doc python3-dev
sudo apt-get install --assume-yes ipython3
sudo apt-get install --assume-yes fzf ripgrep silversearcher-ag fd-find bat
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
sudo apt-get install --assume-yes vim vim-runtime vim-doc vim-scripts vim-gtk3
sudo apt-get install --assume-yes obs-studio
sudo apt-get install --assume-yes virtualbox virtualbox-ext-pack

# snap installs
sudo snap refresh
sudo snap install chromium  # chromium will be set as default --> manually change back to firefox
sudo snap install chromium-ffmpeg
sudo snap install jabref

# python installs
python3 -m pip install -U pip numpy scipy sympy matplotlib
python3 -m pip install -U pip virtualenv
python3 -m pip install -U pip black isort mypy
python3 -m pip install -U pip fortls debugpy
python3 -m pip install -U pip gmsh
python3 -m pip install -U pip thefuck
python3 -m pip install -U pip vtk
python3 -m pip install -U pip pyvista
python3 -m pip install -U pip jupyterlab
python3 -m pip install -U pip notebook
python3 -m pip install -U pip jupyter-book
python3 -m pip install -U pip jinja2
python3 -m pip install -U pip cpplint
python3 -m pip install -U pip scholarly
python3 -m pip install -U pip pandas
python3 -m pip install -U pip polars
python3 -m pip install -U pip meshio[all]
python3 -m pip install -U pip gstools

# Zoom and VS Code
#   download .deb from:
#       * https://zoom.us/download
#       * https://code.visualstudio.com/download
#   install:
#       sudo apt-get update
#       sudo apt-get install --assume-yes ~/Downloads/code_<VERSION>_amd64.deb
#       sudo apt-get install --assume-yes ~/Downloads/zoom_amd64.deb

# Brave
sudo apt-get update
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt-get update
sudo apt-get install --assume-yes brave-browser

# Sciebo
sudo apt-get update
sudo apt-get install --assume-yes libicu70 libzstd1
wget -nv https://sciebo.de/install/linux/download/Ubuntu_22.04/Release.key -O - | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/owncloud.gpg > /dev/null
echo 'deb https://sciebo.de/install/linux/download/Ubuntu_22.04/ /' | sudo tee -a /etc/apt/sources.list.d/owncloud.list
sudo apt-get update
sudo apt-get install --assume-yes sciebo-client sciebo-client-*

# Pulse/Ivanti vpn problem, see https://git.uni-wuppertal.de/japfeifer/japfeifer/-/issues/1#note_50371
echo 'deb http://download.opensuse.org/repositories/home:/bluca:/openconnect/Ubuntu_22.04/ /' | sudo tee /etc/apt/sources.list.d/home:bluca:openconnect.list
curl -fsSL https://download.opensuse.org/repositories/home:bluca:openconnect/Ubuntu_22.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_bluca_openconnect.gpg > /dev/null
sudo apt-get update
sudo apt-get install --assume-yes openconnect network-manager-openconnect
sudo apt-get install --assume-yes network-manager network-manager-config-connectivity-ubuntu network-manager-dev network-manager-fortisslvpn network-manager-gnome network-manager-iodine network-manager-l2tp network-manager-l2tp-gnome network-manager-openconnect network-manager-openvpn network-manager-pptp network-manager-ssh network-manager-sstp network-manager-strongswan network-manager-vpnc

# final update and upgrade
sudo apt-get update && sudo apt-get upgrade

# add new user and password
#
# sudo useradd -m -s /bin/bash -c "Totti Karotti" totti && sudo passwd totti

# GRUB Configuration (see /etc/default/grub)
#
# see: https://www.gnu.org/software/grub/manual/grub/html_node/Simple-configuration.html
#
# GRUB_TIMEOUT_STYLE=menu
# GRUB_TIMEOUT=5
#
# sudo update-grub
# sudo reboot

# ==============================================================================
#   NOT for everyone!
# ==============================================================================

# # snap installs
# sudo snap refresh
# sudo snap install spotify

# # tmux
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# ~/.tmux/plugins/tpm/bin/install_plugins
# ~/.tmux/plugins/tpm/bin/update_plugins all

# --------------------------------------------------------------------
#   Permssions

# Default:
#   * dir:  drwxrwxr-x  --> chmod 775 --> chmod a+rwx,o-w
#   * file: -rw-rw-r--  --> chmod 664 --> chmod a+rwx,u-x,g-x,o-wx
#
# Private:
#   * dir:  drwx------  --> chmod 700 --> chmod chmod a+rwx,g-rwx,o-rwx
#   * file: -rw-------  --> chmod 600 --> chmod a+rwx,u-x,g-rwx,o-rwx
#
# --> see chmodcommand.com

# Pass and ssh:
#   * cp -r <BACKUP_PATH>/.password-store ~ && chmod 700 ~/.password-store && cd ~/.password-store && chmod 600 .gpg-id *.gpg && cd
#   * cp -r <BACKUP_PATH>/.gnupg ~          && chmod 700 ~/.gnupg          && cd ~/.gnupg          && chmod 600 *.kbx* *seed *.gpg **/*.key **/*.rev && chmod 700 openpgp-revocs.d private-keys-v1.d && cd
#   * cp -r <BACKUP_PATH>/.ssh ~            && chmod 700 ~/.ssh            && cd ~/.ssh            && chmod 600 id* config known_hosts* && cd

# --------------------------------------------------------------------
#   Dell Precision 5470 webcam problem

# see https://wiki.ubuntu.com/Dell:

# To install IPU6/IPU6EP stack manually on 22.04 stock Ubuntu (non-certified for
# 22.04) (ppa:oem-solutions-group/intel-ipu6 is a development PPA so it will
# integrate the latest Intel MIPI camera blobs, and there is no guarantee that
# the Intel MIPI camera will work after you installed the packages from
# ppa:oem-solutions-group/intel-ipu6.)

# Dell Precision 5470:

# sudo add-apt-repository ppa:oem-solutions-group/intel-ipu6
# sudo apt install linux-modules-ipu6-generic-hwe-22.04 linux-modules-ivsc-generic-hwe-22.04
# sudo apt install libcamhal-ipu6ep0
# sudo reboot
