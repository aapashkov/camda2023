#!/bin/bash
# Installs all necessary software for CAMDA 2023 and creates venv/ environment.
# Requires docker. Specifically, it installs the following programs:
    # Kraken2
    # MEGAHIT
    # MinPath (as standalone package)
    # eggNOG-mapper
    # RGI (via docker)
    # TrimGalore

# Usage:  ./initialize.sh

# Create virtual environment in venv/
cd $(dirname "$(dirname "$(readlink -f $0)")")
conda create -y -c conda-forge -c bioconda -p ./venv kraken2 megahit trim-galore eggnog-mapper # prokka

# Pull RGI docker image
docker pull finlaymaguire/rgi:latest

# Clone MinPath repository
git clone https://github.com/mgtools/MinPath.git
