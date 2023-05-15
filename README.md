# CAMDA 2023

## Data

Antimicrobial resistance and taxonomic classification data for CAMDA 2023 was
published at Zenodo. Currently, it only stores 2017 sample data.

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.7905441.svg)](https://doi.org/10.5281/zenodo.7905441)

These are the cisites from 2017 data
BAL
DEN
DOH
ILR
MIN
NYC
SAN
SAO
TOK
VIE
ZRH

Data is structured as follows:

- `samples_2017.txt` is the list of samples from 2017.
- `reports_2017.tar.gz` contains [Kraken2](https://ccb.jhu.edu/software/kraken2/)
classification reports from samples of 2017. Uncompress with:

```shell
tar -xf reports_2017.tar.gz
```

- `biom_2017.tsv` is a TSV file in [BIOM](https://biom-format.org/) format
produced from the reports contained in `reports_2017.tar.gz`.
- `amr_2017.tar.gz` contains [RGI](https://github.com/arpcard/rgi)'s TSV outputs
with information on the identified antimicrobial resistance markers at
[allele](https://github.com/arpcard/rgi#rgi-bwt-read-mapping-results-at-allele-level)
and [gene](https://github.com/arpcard/rgi#rgi-bwt-read-mapping-results-at-gene-level)
levels for every sample of 2017, using [CARD and WildCARD](https://card.mcmaster.ca/)
databases. Uncompress with:

```shell
tar -xf amr_2017.tar.gz
```

Download the whole dataset with:

```shell
wget https://zenodo.org/record/7905441/files/{amr_2017.tar.gz,biom_2017.tsv,reports_2017.tar.gz,samples_2017.txt}
```
