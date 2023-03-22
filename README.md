# CAMDA 2023

## Data download

The whole-genome sequencing (WGS) reads provided by the MetaSUB International Consortium are available on an SFTP server, which requires a password that'll be provided after accepting the CAMDA agreement [here](http://camda2023.bioinf.jku.at/agreement). In order to do so, one must first [register](http://camda2023.bioinf.jku.at/agreement?do=register) or [log in](http://camda2023.bioinf.jku.at/agreement?do=login) at the CAMDA agreement website.

We'll create the CAMDA 2023 base directory at `/datos/camda2023/`, where we'll then add a subdirectory called `metasub` that'll contain the MetaSUB WGS reads. Because the amount of files is large, the whole download process will be executed inside an alternative screen.

```shell
$ screen -S metasub
$ mkdir -p /datos/camda2023/metasub
$ cd /datos/camda2023/metasub
$ sftp camda@metasub.ethz.ch
$ # Password given at http://camda2023.bioinf.jku.at/data_download
sftp> cd camda2023
sftp> get -a *  # Takes a long time, detach from screen with Ctrl+A D
sftp> exit      # Exit sftp shell
$ exit          # Exit metasub screen
```

The `-a` flag for `get` is used so that only new files are downloaded, and old ones are skipped. This was done due to the fact that sometimes the download process may halt, making it necessary to check the download state frequently, and resume it appropriately. Because halting might happen in the middle of a download, files in which `sftp` got stuck were deleted prior to running `get -a *` once again.

## Classification

The next step is to perform a taxonomic classification on the downloaded data using [kraken2](https://ccb.jhu.edu/software/kraken2/). We'll create a `kraken` directory for the program's outputs inside CAMDA 2023's root directory (`/datos/camda2023/`). Inside the `kraken` directory, we'll have two directories, one for `outputs` and another for `reports`. The output filenames will follow the original filenames without the extension, and will use `.kraken` and `.report` extensions for `kraken2` outputs and reports, respectively. Because the sequence files are paired and gzipped, we'll use the `--paired` and `--gzip-compressed` flags. We will also employ a previously build `kraken2` database located at `/datos/camda2023/kraken/db/`.

```shell
$ screen -S kraken
$ conda activate metagenomics
$ mkdir -p /datos/camda2023/kraken/reports
$ mkdir -p /datos/camda2023/kraken/outputs
$ cd /datos/camda2023/metasub/
$ ls *_1.fastq.gz | cat | while read f1;
> do
> basename="${f1%%_1.*}";   # Filename without the last "_#.fastq.gz"
> f2="${basename}_2.fastq.gz";
> echo ""
> echo "${basename}"
> kraken2 --db ../kraken/db/ --gzip-compressed --paired \
> --threads 16 --output "../kraken/outputs/${basename}.kraken" \
> --report "../kraken/reports/${basename}.report" "$f1" "$f2";
> done
$ exit	# Exit kraken screen
```