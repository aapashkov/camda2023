#!/bin/bash

# This script executes the whole analysis pipeline for a given basename. In
# particular, it does the following:

#   Download files with the input basename (by copying from $basedir/metasub)
#   TODO: Preprocess input files (with trimmomatic)
#   Perform taxonomic classification (with kraken2)
#   Identify antimicrobial resistance (with rgi)
#   Compress results and delete unnecessary files to save space

basedir=$(dirname "$(dirname "$(readlink -f "$0")")")
cd $basedir
f1=${1}_1.fastq.gz
f2=${1}_2.fastq.gz
mkdir -p logs finished
source activate venv/ > logs/${1}.log 2>&1

# Download files
echo $(date +"%D %T:") Downloading $f1 >> logs/${1}.log 2>&1
cp metasub/${f1} . >> logs/${1}.log 2>&1
echo $(date +"%D %T:") Downloading $f2 >> logs/${1}.log 2>&1
cp metasub/${f2} . >> logs/${1}.log 2>&1

# Preprocess input files
# TODO: Trimmomatic command goes here...

# Perform taxonomic classification
mkdir -p outputs/
mkdir -p reports/
echo $(date +"%D %T:") Classifying $1 >> logs/${1}.log 2>&1

kraken2 --db krakenDB/ --threads 16 --gzip-compressed --paired \
  --output outputs/${1}.output --report reports/${1}.report \
  $f1 $f2 >> logs/${1}.log 2>&1

# Identify antimicrobial resistance
mkdir -p amr
echo $(date +"%D %T:") Identifying AMR in $1 >> logs/${1}.log 2>&1
rgitest=$(rgi database -v --local)

# Load database to RGI if it wasn't done so already
if [ "$rgitest" != "3.2.6" ]; then
  rgi load --wildcard_annotation localDB/wildcard_database_v4.0.0.fasta \
    --wildcard_index localDB/wildcard/index-for-model-sequences.txt \
    --card_annotation localDB/card_database_v3.2.6.fasta --local \
    --card_json localDB/card.json >> localDB/card_load.log 2>&1
fi

# Run RGI bwt on basename
mkdir -p amr/${1}
rgi bwt --local -1 ${1}_1.fastq.gz -2 ${1}_2.fastq.gz -n 10 \
  -o amr/${1}/${1} --clean --include_wildcard >> logs/${1}.log 2>&1

# Compress all outputs
echo $(date +"%D %T:") Compressing $1 outputs >> logs/${1}.log 2>&1
gzip -v outputs/${1}.output reports/${1}.report >> logs/${1}.log 2>&1
tar -czvf amr/${1}.rgi.tar.gz -C amr/ ${1}/ >> logs/${1}.log 2>&1

# Delete input files to save space
echo $(date +"%D %T:") Cleaning up $1 >> logs/${1}.log 2>&1
rm -rvf $f1 $f2 amr/${1} >> logs/${1}.log 2>&1  # TODO: add trimmed file removal

# Remove repetitive line from log and compress it
sed -i '/mapped query cannot have zero coordinate/d' logs/${1}.log
gzip logs/${1}.log

# Add basename to finished directory (not mandatory, used for quick reference)
touch finished/${1}
