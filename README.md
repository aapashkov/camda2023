# CAMDA 2023

## Data

Antimicrobial resistance and taxonomic classification data for CAMDA 2023 is
published at Zenodo:

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.8001481.svg)](https://doi.org/10.5281/zenodo.8001481)

It consists of a single `zip` file with the following directory structure:

```text
c23.zip
├── amr/
│   ├── json/
│   │   └── <basename>.json
│   ├── tsv/
│   │   └── <basename>.tsv
│   └── amr-biom.tsv
├── functions/
│   ├── html/
│   │   └── <basename>.html
│   └── tsv/
│       └── <basename>.tsv
├── taxonomy/
│   ├── assembly-level/
│   │   └── <basename>.report
│   ├── read-level/
│   │   └── <basename>.report
│   ├── assembly-biom.tsv
│   └── read-biom.tsv
├── amr_patterns.tsv
├── basenames.txt
└── missing.txt
```

The `<basename>` element corresponds to the sample name without extension;
for example: `CAMDA23_MetaSUB_gCSD17_SAN_3`. Data is structured as follows:

- `basenames.txt` is the list of basenames currently available.
- `missing.txt` is the list of basenames not currently available (to be
finished).
- `taxonomy/assembly-level/` and `taxonomy/read-level/` contain
[Kraken2](https://ccb.jhu.edu/software/kraken2/) classification reports at
assembly and read levels.
- `assembly-biom.tsv` and `read-biom.tsv` are TSV files in
[BIOM](https://biom-format.org/) format produced from the reports contained in
`taxonomy/assembly-level` and `taxonomy/read-level`.
- `amr/` contains [RGI](https://github.com/arpcard/rgi)'s
TSV and JSON outputs with information on the identified antimicrobial resistance
markers, using the [CARD](https://card.mcmaster.ca/) database.
- `functions/` contains functional annotation information in TSV and HTML format
(the latter only for visualization purposes).
- `amr_patterns.tsv` is a TSV file containing the AMR markers and AST resistance
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

|ID_city|City           |Latitude	|Longitude   |Climate|Year  |
|-------|---------------|-----------|------------|-------|------|
|AKL	|Auckland       |-36.8508827| 174.7644881|Cfb    |2016  |
|BAL	|Baltimore      | 39.2903848| -76.6121893|Cfa    |2017  |
|BER	|Berlin         | 52.5200066|  13.404954 |Cfb    |2016  |
|BOG	|Bogota         |  4.7109886| -74.072092 |Cfb    |2016  |
|DEN	|Denver         | 39.7392358|-104.990251 |BSk    |2016-7|
|DOH	|Doha           | 25.2854473|  51.5310398|BWh    |2016-7|
|ILR	|Ilorin         |  8.5373356|   4.5443923|Aw     |2016-7|
|LIS	|Lisbon         | 38.7222524|  -9.1393366|Csa    |2016  |
|MIN	|Mineapolis     | 44.977753	| -93.2650108|Dfa    |2017  |
|NYC	|New York City  | 40.7127753| -74.0059728|Cfa    |2016-7|
|SAC	|Sacramento	    | 38.5815719|-121.4943996|Csa    |2016  |
|SAN	|San Antonio	| 29.4251905| -98.4945922|Cfa    |2017  |
|SAO	|Sao Paulo	    |-23.5557714| -46.6395571|Cfa    |2017  |
|TOK	|Tokyo	        | 35.6761919| 139.6503106|Cfa    |2016-7|
|VIE	|Vienna         | 48.2081743|  16.3738189|Cfb    |2017  |
|ZRH    |Zurich	        | 47.3768866|   8.541694 |Cfb    |2017  |

Download the dataset with:

```shell
wget https://zenodo.org/record/8001481/files/c23.zip
```
