# Installs

    sudo apt-get update && sudo apt-get upgrade --assume-yes
    sudo apt-get install --assume-yes curl
    curl --silent https://raw.githubusercontent.com/janmirco/setup/main/iman/iKubuntu.sh | sudo bash

# User management

### Add new user and password

    sudo useradd --create-home --shell /bin/bash --comment "Totti Karotti" totti && sudo passwd totti

### Add user to sudo group

    sudo usermod -aG sudo totti

### Rename user

    sudo usermod --login bob --comment "Bob Newman" totti

### Rename home directory

    sudo usermod --home /home/bob --move-home totti

### Rename user group

    sudo --new-name bob totti

# GRUB configuration

Edit `/etc/default/grub`:

    GRUB_TIMEOUT_STYLE=menu
    GRUB_TIMEOUT=5

Update & reboot:

    sudo update-grub
    sudo reboot

See [here](https://www.gnu.org/software/grub/manual/grub/html_node/Simple-configuration.html).

# SSH

Check `~/.ssh` for existing keys and delete them if you want to create new ones.
Set up `~/.ssh/config`, for example:

    Host *
        IdentitiesOnly yes

    Host github.com
        Hostname github.com
        User git
        Port 22
        PreferredAuthentications publickey
        IdentityFile /home/jan/.ssh/id_ed25519_github

Create a new key:

    ssh-keygen -t ed25519 -C "your_email@example.com"

Enter file location with postfix, for example `/home/jan/.ssh/id_ed25519_github`.
Type a secure (but easy to remember) passphrase or none.
Add your SSH key to the ssh-agent (with example from above):

    eval "$(ssh-agent -s)"
    ssh-add /home/jan/.ssh/id_ed25519_github

### Use key pair for a git remote

Copy PUBLIC key, use:

    xclip -selection clipboard < /home/jan/.ssh/id_ed25519_github.pub`

Add the SSH key to your GitHub account.
Test your SSH connection (`hostname` after `@` can be filled with `TAB`):

    ssh -T git@github.com

### Use key pair for any server/computer

Copy key using the following command:

    ssh-copy-id -i /home/jan/.ssh/id_ed25519_other username@remote_host

# Rsync

You can back up all of your files to an external hard drive with the following command.

    rsync -aAXzv SOURCE DESTINATION

    --archive, -a            archive mode is -rlptgoD (no -A,-X,-U,-N,-H)
    --acls, -A               preserve ACLs (implies --perms)
    --xattrs, -X             preserve extended attributes
    --verbose, -v
    --compress, -z           compress file data during the transfer

Excluding directories can be done using the `--exclude` flag.
Here is an example for a manual backup.

    rsync -aAXzv --exclude={'.cache','.local'} /home/jan/ /media/jan/WD5TB/manual-backups/laptop-home/jan/

You can use `rsync` over SSH to a remote location using the following command.

    rsync -aAXzv -e ssh SOURCE DESTINATION

For example, you can copy/update the file `some.txt` from your home directory to a remote home directory with this command.

    rsync -aAXzv -e ssh ~/some.txt USER_NAME@IP_ADDRESS:~

# Permssions

See: <https://www.chmodcommand.com>

### Default

- dir: `drwxrwxr-x  --> chmod 775 --> chmod a+rwx,o-w`
- file: `-rw-rw-r--  --> chmod 664 --> chmod a+rwx,u-x,g-x,o-wx`

### Private

- dir: `drwx------  --> chmod 700 --> chmod chmod a+rwx,g-rwx,o-rwx`
- file: `-rw-------  --> chmod 600 --> chmod a+rwx,u-x,g-rwx,o-rwx`

### Pass and ssh

- `cp -r <BACKUP_PATH>/.password-store ~ && chmod 700 ~/.password-store && cd ~/.password-store && chmod 600 .gpg-id *.gpg && cd`
- `cp -r <BACKUP_PATH>/.gnupg ~          && chmod 700 ~/.gnupg          && cd ~/.gnupg          && chmod 600 *.kbx* *seed *.gpg **/*.key **/*.rev && chmod 700 openpgp-revocs.d private-keys-v1.d && cd`
- `cp -r <BACKUP_PATH>/.ssh ~            && chmod 700 ~/.ssh            && cd ~/.ssh            && chmod 600 id* config known_hosts* && cd`
