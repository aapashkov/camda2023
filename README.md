# CAMDA 2023

## Data

Antimicrobial resistance and taxonomic classification data for CAMDA 2023 was
published at Zenodo. It stores 2016 (incomplete) and 2017
(full) sample data.

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.7938911.svg)](https://doi.org/10.5281/zenodo.7938911)

The following is a list of cities in the 2016 sample data; the information for
some cities is currently incomplete and marked accordingly:

- AKL (Auckland?)
- BER (Berlin)
- BOG (Bogota, incomplete)
- DEN (Denver)
- DOH (Doha)
- ILR (Ilorin, incomplete)
- LIS (Lisbon)
- NYC (New York City, incomplete)
- SAC (Sacramento)
- TOK (Tokyo, incomplete)

The 2017 sample data has the following cities:

- BAL (Baltimore)
- DEN (Denver)
- DOH (Doha)
- ILR (Ilorin)
- MIN (Mineapolis)
- NYC (New York City)
- SAN (San Antonio)
- SAO (Sao Paulo)
- TOK (Tokyo)
- VIE (Vienna)
- ZRH (Zurich)

|ID_city	|City	|Latitude	|Longitude|  |  
|---------|-----|---------|---------|--|   
|AKL	|Auckland	|-36.8508827	|174.7644881|  Cfb   |  
|BAL	|Baltimore	|39.2903848|	-76.6121893  |Cfa |    
|BER	|Berlin	|52.5200066	|13.404954  |Cfb  |  
|BOG	|Bogota, incomplete	|4.7109886|	-74.072092|Cfb |    
|DEN	|Denver	|39.7392358|	-104.990251| BSk   |  
|DOH	|Doha	|25.2854473	|51.5310398|BWh   |  
|ILR	|Ilorin	|8.5373356	|4.5443923|Aw |  
|ILR	|Ilorin, incomplete	|8.5373356|	4.5443923| Aw  |    
|LIS	|Lisbon	|38.7222524|	-9.1393366| Csa  |  
|MIN	|Mineapolis|	44.977753	|-93.2650108| Dfa   |   
|NYC	|New York City|	40.7127753	|-74.0059728| Cfa  |    
|NYC	|New York City, incomplete|	40.7127753|	-74.0059728|Cfa|    
|SAC	|Sacramento	|38.5815719|	-121.4943996|  Csa  |  
|SAN	|San Antonio	|29.4251905	|-98.4945922| Cfa  |  
|SAO	|Sao Paulo	|-23.5557714	|-46.6395571|  Cfa |  
|TOK	|Tokyo	|35.6761919|	139.6503106| Cfa   |  
|TOK	|Tokyo, incomplete	|35.6761919|	139.6503106| Cfa |    
|VIE	|Vienna|	48.2081743	|16.3738189| Cfb   |  
|ZRH|	Zurich	|47.3768866	|8.541694| Cfb  |  
    
Data is structured as follows:

- `samples_2016.txt` and `samples_2017.txt` are the lists of samples from 2016 and
2017, respectively.
- `reports_2016.tar.gz` and `reports_2017.tar.gz` contain
[Kraken2](https://ccb.jhu.edu/software/kraken2/) classification reports from samples
of 2016 and 2017, respectively. Uncompress with:

```shell
tar -xf reports_2016.tar.gz
tar -xf reports_2017.tar.gz
```

- `biom_2016.tsv` and `biom_2017.tsv` are TSV files in [BIOM](https://biom-format.org/)
format produced from the reports contained in `reports_2016.tar.gz` and `reports_2017.tar.gz`,
respectively.
- `amr_2016.tar.gz` and `amr_2017.tar.gz` contains [RGI](https://github.com/arpcard/rgi)'s
TSV outputs with information on the identified antimicrobial resistance markers at
[allele](https://github.com/arpcard/rgi#rgi-bwt-read-mapping-results-at-allele-level)
and [gene](https://github.com/arpcard/rgi#rgi-bwt-read-mapping-results-at-gene-level)
levels for every sample of 2016 and 2017, using [CARD and WildCARD](https://card.mcmaster.ca/)
databases. Uncompress with:

```shell
tar -xf amr_2016.tar.gz
tar -xf amr_2017.tar.gz
```

Download the whole dataset with:

```shell
wget https://zenodo.org/record/7938911/files/{amr_201{6,7}.tar.gz,biom_201{6,7}.tsv,reports_201{6,7}.tar.gz,samples_201{6,7}.txt}
```
