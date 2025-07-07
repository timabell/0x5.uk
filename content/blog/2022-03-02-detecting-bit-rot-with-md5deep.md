+++
title = "Detecting bit-rot with md5deep"
+++

Thanks to [luxagen](http://luxagen.com/) for getting me to actually set something up for this. Turned out to be mighty useful when I accidentally trashed half my home folder and wanted to know if [syncthing](https://syncthing.net/) had propagated any of the damage.

The use case is slightly different to mine, but [RotKraken](https://github.com/luxagen/RotKraken) is worth a look. Its unique feature is storing file hashes in the extended attributes of the same file. This is very tidy but doesn't help me with catching unwanted deletions, hence going back to md5deep.

You'd think that running [md5deep aka hashdeep](https://github.com/jessek/hashdeep) wouldn't be worthy of a blog post, but what I found is that the primary use case for hashdeep is actually validating the integrity of an installation in order to detect rootkits etc. This is not the same as what I'm doing which is being able to spot if I've lost any files I care about in `/home/tim` through carelessness or [bit-rot](https://en.wikipedia.org/wiki/Data_degradation). It turns out that md5deep does actually have what I needed, but the way the options are described means it's not at all obvious that it would fulfill this need.

You can find [my hash and verify scripts as a gist here](https://gist.github.com/timabell/f70f34f8933b2abaf42789f8afdbd7d5)

It turns out the magic is in the "audit" section of the docs.

The terminology of the verification output is more about what it did than why you care. The important one for spotting bit-rot when verifying is `Known file not used` which means that you have a hash but you no longer have a matching file anywhere. Either you deleted it or modified it on purpose or you've just lost something you care about. Time to reach for the backups. I like [back-in-time](https://backintime.readthedocs.io/) to usb disks for backup.

## Hashing


```
hashdeep -c md5 -of -r -l Music Documents > hash_file.txt
```

<https://explainshell.com/explain?cmd=hashdeep+-c+md5+-of+-r+-l+Music+Documents>

Output:

```
%%%% HASHDEEP-1.0
%%%% size,md5,filename
## Invoked from: /home/tim
## $ hashdeep -c md5 -of -r -l Music Downloads Documents Pictures Phone Dropbox repo
## 
3425,3ecc5852703f3846298b381bc2510a39,Music/checksums-verification-Music.txt
461,456e92277eaf9de695bd1229d80f059b,Music/checksums-verification-Music.txt.bak
100663,0d9d53e95e5d80fa43a64f5d02f25b1e,Music/checksums-Music.txt
794926,95c1558e7c97200140c37ffb0d12669d,Music/flac/Mordecai Smyth - Dial M For Mordecai/cover.jpg
17618302,cfb11490aacfdcbb79fd4310cf834e01,Music/flac/Mordecai Smyth - Dial M For Mordecai/Mordecai Smyth - Dial M For Mordecai - 02 Psychedelic Sarah.flac
...
```

## Verifying

```
hashdeep -k  hash_file.txt -rle -of Music Documents -avv
```

<https://explainshell.com/explain?cmd=hashdeep+-k++hash_file.txt+-rle+-of+Music+Documents+-avv>

Output:
```
Documents/hashdeep-checksums-verification.txt.bak: Moved from Documents/hashdeep-checksums-verification.txt
Documents/hashdeep-checksums-verification.txt: No match
Documents/hashdeep-checksums.txt: No match
repo/rust-kata/.idea/workspace.xml: No match
repo/rust-kata/.git/logs/HEAD: No match
...
Documents/hashdeep-checksums-verification.txt.bak: Known file not used
Documents/hashdeep-checksums.txt: Known file not used
repo/rust-kata/.idea/workspace.xml: Known file not used
...
```

## Workflow

I have a monthly calendar reminder to run backups. When that goes off I:

1. Run `verify-hashes.sh` and search the output for "Known file not used" to find any rot or churn.
1. Run `rehash.sh` to update the hashes.
1. Plug a backup HDD in and run back-in-time to update the backup
1. Sleep easy.

I run one hash file for all folders. I started with one per top level folder but that meant the verify couldn't spot things moved between folders and it reported them as missing.

It would be nice to iterate on this but it's a good start.

## Updated workflow Jun 2025

I've ditched the odd hashdeep format that I only used because of the "audit" capability, and am now using the more common md5deep format (same binary, different file format),

```sh
╰─$ cat checksum-home.sh 
#!/bin/bash
set -e # exit on error
cd ~
backup_paths=(Music Downloads Documents etc...)
hashfile="Documents/checksums/home/md5deep-checksums-$(date "+%Y%m%d-%H%M%S").md5"
# -r = recursive
# -l = relative paths
time md5deep -r -l "${backup_paths[@]}" | tee "$hashfile"
```
<https://explainshell.com/explain?cmd=md5deep+-rl+.>

... then using [my fork of md5-tools](https://github.com/timabell/md5-tools) - subcommand `md5-diff` - to assess differences between hash files, filtered through a quick [awol-hashes bash script](https://gist.github.com/timabell/f7f776c7f0792ea13ef44798082b9935) to show only the files that have vanished or been modified.

The result is then sent piped through [paths2html](https://github.com/rustworkshop/paths2html) that I wrote to give a collabsible html view of the missing files for easy review.

```sh
md5-diff "$before" "$after" | grep --regexp '^\+A' | sed 's/^\+A //' | tee "$missing_hashes_file"
cat "$missing_hashes_file" | awk '{print substr($0, index($0, $2))}' | paths2html > "$missing_hashes_html_file"
xdg-open "$missing_hashes_html_file"
```
