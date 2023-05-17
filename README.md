# CAMDA 2023

## Data

Antimicrobial resistance and taxonomic classification data for CAMDA 2023 is
published at Zenodo:

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.7943328.svg)](https://doi.org/10.5281/zenodo.7943328)

It consists of a single `tar.gz` file with the following directory structure:

```text
c23.tar.gz
├── amr_2016/
│   └── CAMDA23_MetaSUB_gCSD16_<city>_<number>
│       ├── CAMDA23_MetaSUB_gCSD16_<city>_<number>.allele_mapping_data.tsv
│       └── CAMDA23_MetaSUB_gCSD16_<city>_<number>.gene_mapping_data.tsv
├── amr_2017/
│   └── CAMDA23_MetaSUB_gCSD17_<city>_<number>
│       ├── CAMDA23_MetaSUB_gCSD17_<city>_<number>.allele_mapping_data.tsv
│       └── CAMDA23_MetaSUB_gCSD17_<city>_<number>.gene_mapping_data.tsv
├── amr_patterns.tsv
├── biom_2016.tsv
├── biom_2017.tsv
├── reports_2016/
│   └── CAMDA23_MetaSUB_gCSD16_<city>_<number>.report
├── reports_2017/
│   └── CAMDA23_MetaSUB_gCSD17_<city>_<number>.report
├── samples_2016.txt
└── samples_2017.txt
```

The elements `<city>` and `<number>` correspond to the city code and the sample
number, respectively. Data is structured as follows:

- `samples_2016.txt` and `samples_2017.txt` are the lists of samples from 2016
and 2017.
- `reports_2016/` and `reports_2017/` contain [Kraken2](https://ccb.jhu.edu/software/kraken2/) classification reports from samples of 2016 and 2017.
- `biom_2016.tsv` and `biom_2017.tsv` are TSV files in
[BIOM](https://biom-format.org/) format produced from the reports contained in
`reports_2016/` and `reports_2017/`.
- `amr_2016/` and `amr_2017/` contain [RGI](https://github.com/arpcard/rgi)'s
TSV outputs with information on the identified antimicrobial resistance markers at
[allele](https://github.com/arpcard/rgi#rgi-bwt-read-mapping-results-at-allele-level)
and [gene](https://github.com/arpcard/rgi#rgi-bwt-read-mapping-results-at-gene-level)
levels for every sample of 2016 and 2017, using
[CARD and WildCARD](https://card.mcmaster.ca/) databases.
- `amr_patters.tsv` is a TSV file containing the AMR markers and AST resistance
groups that were detected from 150 isolates that were collected from a hospital
of the USA between 2016 and 2017. It has four columns:
    - `ID`. The isolate identifier.
    - `Species`. The species from which the AMR markers and AST resistance groups
    were extracted. Three different bacteria species were isolated:
    *Enterobacter hormaechei*, *Escherichia coli*, and *Klebsiella pneumoniae*.
    - `AST-based group`. The AST resistance group detected in every isolate. It
    can be one of three:
        - "3GC" refers to *third-generation cephalosporin resistance*. An
        isolate may be classified as 3GC-*resistant* or 3GC-*susceptible*.
        - "CP CRE" means that the isolate is an *carbapenem-resistant
        Enterobacterales* (CRE) and contains *carbapenemase* (CP) genes.
        - "Non-CP CRE" means that the isolate is an CRE but does not contain
        CP genes.
    - `WGS - AMR markers`. Contains a list of AMR markers that were identified
    in each isolate with Illumina short-reads sequencing (NGS).

The following table contains detailed information on every sampled city.

|ID_city|City           |Latitude	|Longitude   |Climate|Year  |Notes on AMR
|-------|---------------|-----------|------------|-------|------|-----
|AKL	|Auckland       |-36.8508827| 174.7644881|Cfb    |2016  |
|BAL	|Baltimore      | 39.2903848| -76.6121893|Cfa    |2017  |
|BER	|Berlin         | 52.5200066|  13.404954 |Cfb    |2016  |
|BOG	|Bogota         |  4.7109886| -74.072092 |Cfb    |2016  |Incomplete
|DEN	|Denver         | 39.7392358|-104.990251 |BSk    |2016-7|
|DOH	|Doha           | 25.2854473|  51.5310398|BWh    |2016-7|
|ILR	|Ilorin         |  8.5373356|   4.5443923|Aw     |2016-7|Incomplete for 2016
|LIS	|Lisbon         | 38.7222524|  -9.1393366|Csa    |2016  |
|MIN	|Mineapolis     | 44.977753	| -93.2650108|Dfa    |2017  |
|NYC	|New York City  | 40.7127753| -74.0059728|Cfa    |2016-7|Incomplete for 2016
|SAC	|Sacramento	    | 38.5815719|-121.4943996|Csa    |2016  |
|SAN	|San Antonio	| 29.4251905| -98.4945922|Cfa    |2017  |
|SAO	|Sao Paulo	    |-23.5557714| -46.6395571|Cfa    |2017  |
|TOK	|Tokyo	        | 35.6761919| 139.6503106|Cfa    |2016-7|Incomplete for 2016
|VIE	|Vienna         | 48.2081743|  16.3738189|Cfb    |2017  |
|ZRH    |Zurich	        | 47.3768866|   8.541694 |Cfb    |2017  |

Download the dataset with:

```shell
wget https://zenodo.org/record/7943328/files/c23.tar.gz
```
