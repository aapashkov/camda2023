#!/bin/bash
# Finds AMR genes in the assembled metagenome of a basename, skips if already
# done. Requires docker. Outputs to amr/[basename].tsv and amr/[basename].json.

# Usage:  ./detect-amr.sh [basename]


# Change to base directory and create necessary subdirectories
cd $(dirname "$(dirname "$(readlink -f $0)")")
mkdir -p amr logs/detect-amr

# If file hasn't been processed yet
if [[ ! -f amr/${1}.tsv ]]; then

  echo ""
  echo $(date) ${1}

  # Run AMR detection
  time docker run -v $PWD:/data finlaymaguire/rgi rgi main \
    --local --clean -i assembled/${1}.fasta -o amr/${1} -a DIAMOND -n 64 \
    --low_quality --include_nudge --split_prodigal_jobs

  # Remove inactivate dockers
  docker rm $(docker ps -a -q) > /dev/null 2>&1

  # Rename txt to tsv
  mv amr/${1}.txt amr/${1}.tsv

fi >> logs/detect-amr/${1}.log 2>&1
