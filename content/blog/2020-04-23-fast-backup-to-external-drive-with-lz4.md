---
title: Fast backup to external drive with lz4
layout: post
---

The simplest backup is to just tar-gz your home directory, but it's painfully
slow. [A friend](http://blog.luxagen.com/2016/build-backups-an-unexpected-journey/) put me on to [lz4](https://lz4.github.io/lz4/) which isn't installed by default in ubuntu &
mint, it moves the bottleneck from the compressor to disk i/o for my spinning
rust usb disks.

The default output of this is basically silence for two hours while it runs
which isn't great. Enter `pv` ([pipe
viewer](https://www.howtogeek.com/428654/how-to-monitor-the-progress-of-linux-commands-with-pv-and-progress/))
which can show you progress based on byte count.

Install lz4 and pv with:

    sudo apt install liblz4-tool pv

And then pipe the output of tar through pv and into lz4

Here's a quick script for backing up my home folder to an external drive;
customize to suit your needs:

```bash
#!/bin/sh
# https://gist.github.com/timabell/68d112d66623d9a4a3643c86a93debee#file-backup-sh
echo "Opening/creating backup folder..."
mountpoint=/media/tim/backup/
cd "$mountpoint"
mkdir -p fox
cd fox
base=/home/
src=tim
echo "Getting source folder size..."
size_bytes=`du -sb "$base/$src" | awk '{print $1}'`
echo "$size_bytes bytes to backup."
echo "Backing up..."
tar -cpC $base $src -P | pv -s "$size_bytes" | lz4 >> "$(date -d "today" +"%Y%m%d-%H%M")-home.tar.lz4"
echo "Done."
```

*This script is also available here:
<https://gist.github.com/timabell/68d112d66623d9a4a3643c86a93debee#file-backup-sh>*

## Things to watch out for

* Progress is inaccurate and variable because it's based on input bytes
	processed vs total, but the speed is limited by output bytes to the spinning
	rust backup disk, and the ratio varies with the compressability of the input
	data.
* Finding a file will require reading or decompressing the entire archive
	because of the way tar works.

## Keeping it simple

There's lots of great backup tools for backing up home but most of them create
obscure custom formatted backups, often with incremental backups and chunked up
files for efficient use of space. While that's great I know from experience
that you don't always have all the right tools available to unpack such things
when you really need them, and there's always the chance that you are missing
an important incremental. In short complexity is worrying when it comes to
backup (and especially restore).

## References:

* <https://stackoverflow.com/questions/24063846/how-to-use-tar-with-lz4#24086155>
* <https://superuser.com/questions/168749/is-there-a-way-to-see-any-tar-progress-per-file/665181#665181>
* <https://stackoverflow.com/questions/8228047/adding-timestamp-to-a-filename-with-mv-in-bash/8229220#8229220>
