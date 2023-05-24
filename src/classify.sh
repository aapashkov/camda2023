#!/bin/bash
# Classifies taxonomically the trimmed metagenome of a basename, skips if
# already done. Run with venv/ activated. Outputs to reports/[basename].report.

# Usage:  ./classify.sh [basename]


# Change to base directory and create necessary subdirectories
cd $(dirname "$(dirname "$(readlink -f $0)")")
mkdir -p reports logs/classify

# If basename hasn't been classified yet
if [[ ! -f reports/${1}.report ]]; then

  echo ""
  echo $(date) ${1}

  # Get input filenames
  f1="trimmed/${1}_2.fastq.gz"
  f2="trimmed/${1}_2.fastq.gz"

  # Run taxonomic classification
  time kraken2 --db krakenDB/ --threads 64 --output '-' \
    --report reports/${1}.report --paired --gzip-compressed ${f1} ${f2}
  
fi >> logs/classify/${1}.log 2>&1
