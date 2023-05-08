#!/bin/bash

# This script mounts the CAMDA SFTP server to filesystem at $basedir/metasub/.
# It sends a signal to the server every minute to keep it alive and to not
# disconnect. A password will be prompted, which can be found here:
# http://camda2023.bioinf.jku.at/data_download

# To unmount from filesystem, type:
#   umount $basedir/metasub/

basedir=$(dirname "$(dirname "$(readlink -f "$0")")")
cd $basedir
source activate venv/
mkdir -p metasub
if ! mountpoint -q metasub/; then
    sshfs -o reconnect,ServerAliveInterval=60,ServerAliveCountMax=3 camda@camda.bio.edu.pl:/ metasub
fi
