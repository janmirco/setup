Installs
================================================================================

```
sudo ./installs/apt.sh
sudo ./installs/snap.sh
```

Do **NOT** run the following installs as root:

```
./installs/tldr.sh  # DO NOT RUN AS ROOT!
./installs/pip.sh  # DO NOT RUN AS ROOT!
```

Run installs directly:

```
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install curl
curl --silent https://raw.githubusercontent.com/janmirco/setup/main/installs/apt.sh | sudo bash
curl --silent https://raw.githubusercontent.com/janmirco/setup/main/installs/snap.sh | sudo bash
curl --silent https://raw.githubusercontent.com/janmirco/setup/main/installs/tldr.sh | bash
curl --silent https://raw.githubusercontent.com/janmirco/setup/main/installs/pip.sh | bash
```


### Special installs

Spotify:

```
sudo snap refresh
sudo snap install spotify
```

TPM for tmux:

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins
~/.tmux/plugins/tpm/bin/update_plugins all
```



User management
================================================================================

### Add new user and password

```
sudo useradd -m -s /bin/bash -c "Totti Karotti" totti && sudo passwd totti
```



GRUB configuration
================================================================================

see:
* /etc/default/grub
* https://www.gnu.org/software/grub/manual/grub/html_node/Simple-configuration.html

```
GRUB_TIMEOUT_STYLE=menu
GRUB_TIMEOUT=5
```

```
sudo update-grub
sudo reboot
```



Permssions
================================================================================

see https://www.chmodcommand.com


### Default

* dir:  `drwxrwxr-x  --> chmod 775 --> chmod a+rwx,o-w`
* file: `-rw-rw-r--  --> chmod 664 --> chmod a+rwx,u-x,g-x,o-wx`


### Private

* dir:  `drwx------  --> chmod 700 --> chmod chmod a+rwx,g-rwx,o-rwx`
* file: `-rw-------  --> chmod 600 --> chmod a+rwx,u-x,g-rwx,o-rwx`


### Pass and ssh

* `cp -r <BACKUP_PATH>/.password-store ~ && chmod 700 ~/.password-store && cd ~/.password-store && chmod 600 .gpg-id *.gpg && cd`
* `cp -r <BACKUP_PATH>/.gnupg ~          && chmod 700 ~/.gnupg          && cd ~/.gnupg          && chmod 600 *.kbx* *seed *.gpg **/*.key **/*.rev && chmod 700 openpgp-revocs.d private-keys-v1.d && cd`
* `cp -r <BACKUP_PATH>/.ssh ~            && chmod 700 ~/.ssh            && cd ~/.ssh            && chmod 600 id* config known_hosts* && cd`



Dell Precision 5470 webcam problem
================================================================================

see https://wiki.ubuntu.com/Dell

> To install IPU6/IPU6EP stack manually on 22.04 stock Ubuntu (non-certified
> for 22.04) (ppa:oem-solutions-group/intel-ipu6 is a development PPA so it
> will integrate the latest Intel MIPI camera blobs, and there is no guarantee
> that the Intel MIPI camera will work after you installed the packages from
> ppa:oem-solutions-group/intel-ipu6.)

```
sudo add-apt-repository ppa:oem-solutions-group/intel-ipu6
sudo apt install linux-modules-ipu6-generic-hwe-22.04 linux-modules-ivsc-generic-hwe-22.04
sudo apt install libcamhal-ipu6ep0
sudo reboot
```
