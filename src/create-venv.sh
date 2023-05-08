#!/bin/bash

# This script creates the virtual environment with all the software used for
# the CAMDA 2023 challenge. The environment is produced in $basedir/venv.

basedir=$(dirname "$(dirname "$(readlink -f "$0")")")
cd $basedir
mkdir -p logs

# Environment creation
conda create -q -y -c conda-forge -c bioconda -p $basedir/venv megahit kraken2

# Minor edit to avoid kraken database build error
sed -i 's/\^ftp:/\^https:/' venv/share/kraken2*/libexec/rsync_from_ncbi.pl

# Download rgi as docker and add to venv
docker pull finlaymaguire/rgi:latest
echo 'docker run -v $PWD:/data finlaymaguire/rgi rgi $@' >> venv/bin/rgi
chmod u+x venv/bin/rgi

# Download sshfs and add to venv
apt download sshfs
dpkg -x sshfs* venv/
cp -r venv/usr/* venv/
rm sshfs*
