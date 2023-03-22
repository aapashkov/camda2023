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
sftp> get -a *	# This part takes a lot of time, to detach from screen press Ctrl+A D
sftp> exit	# Type this when download finishes
$ exit 	# Exit metasub screen
```

The `-a` flag for `get` is used so that only new files are downloaded, and old ones are skipped. This was done due to the fact that sometimes the download process may halt, making it necessary to check the download state frequently, and resume it appropriately. Because halting might happen in the middle of a download, files in which `sftp` got stuck were deleted prior to running `get -a *` once again.