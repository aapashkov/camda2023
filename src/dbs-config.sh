#!/bin/bash

# This script downloads and configures both Kraken2 and RGI databases to be 
# used for taxonomic classification and antimicrobial resistance detection,
# respectively. It takes a while to run, so running it inside an alternative
# screen is recommended.

basedir=$(dirname "$(dirname "$(readlink -f "$0")")")
cd $basedir
source activate venv/
mkdir -p logs
mkdir -p krakenDB/
mkdir -p localDB/

# Download Kraken2/Bracken standard database from BenLandmead's Index zone
wget https://genome-idx.s3.amazonaws.com/kraken/k2_standard_20230314.tar.gz \
  -O krakenDB/db.tar.gz

# Untar and keep only files ending with .k2d inside Kraken2 database directory
tar -xvzf krakenDB/db.tar.gz -C krakenDB/
rm -rf krakenDB/*[^.k2d]

# Clean RGI local database
cd "$basedir/localDB"
rgi clean --local > /dev/null 2>&1

# Download CARD and WildCARD data
wget https://card.mcmaster.ca/download/0/broadstreet-v3.2.6.tar.bz2
tar -xvf broadstreet-v3.2.6.tar.bz2 ./card.json
wget https://card.mcmaster.ca/download/6/prevalence-v4.0.0.tar.bz2
mkdir -p wildcard
tar -xjf prevalence-v4.0.0.tar.bz2 -C wildcard
gunzip wildcard/*.gz
rm broadstreet-v3.2.6.tar.bz2 prevalence-v4.0.0.tar.bz2

# Create RGI annotation files
rgi card_annotation -i card.json > card_annotation.log 2>&1
rgi wildcard_annotation -i wildcard --card_json card.json \
  -v 4.0.0 > wildcard_annotation.log 2>&1

# Load database to RGI
cd ..
rgi load --wildcard_annotation localDB/wildcard_database_v4.0.0.fasta \
  --wildcard_index localDB/wildcard/index-for-model-sequences.txt \
  --card_annotation localDB/card_database_v3.2.6.fasta --local \
  --card_json localDB/card.json >> localDB/card_load.log 2>&1
