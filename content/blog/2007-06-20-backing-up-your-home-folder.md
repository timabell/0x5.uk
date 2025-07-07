---
layout: post
title: backing up your home folder
date: '2007-06-20T20:59:00.000Z'
author: Tim Abell
tags:
- backup
- ubuntu
- linux
- script
modified_time: '2007-06-20T23:10:18.919Z'
blogger_id: tag:blogger.com,1999:blog-5082828566240519947.post-1206082451587115261
blogger_orig_url: https://timwise.blogspot.com/2007/06/backing-up-your-home-folder.html
---

Here I outline the solution I chose for backing up my life, er... I mean home folder. (I'm sure there's life outside /home/tim somewhere...)  

My requirements were:  

*   backup to dvd+rw
*   \>20GB of data to back up
*   no obscure formats (in case I don't have the backup tool when I need to restore)

I looked at several solutions for backups but ended up writing scripts to meet my needs.  

The main script creates a tar file of my home directory, excluding certain items, which is then split into files suitable for writing to dvd+rw discs, with tar based verification, md5sums and file list text files created at the same time.  

The reason for splitting to 3 files per disc is that the [iso 9660](http://en.wikipedia.org/wiki/ISO_9660#The_2_GiB_.28or_4.2GB_depending_on_implementation.29_file_size_limit) spec has a 2GB file size limit, and it's important that the discs are as simple as possible (ie no UDF) to aid recovery in awkward situations. This is also why I avoided compression.  

backup_home.sh  

    #!/bin/bash -v  
    #DVD+R SL capacity 4,700,372,992 bytes DVD, (see [wikipedia on DVD](http://en.wikipedia.org/wiki/DVD))  
    #ISO max file size 2GB. 4.38GB/3 = 1,566,790,997bytes = 1,494MB  
    #1,490MB to leave some space for listings and checksums  
    tar -cvv --directory /home tim --exclude-from backup_home_exclude.txt | split -b 1490m - /var/backups/tim/home/home.tar.split.  
    cd /var/backups/tim/home  
    md5sum home.tar.split.* > home.md5  
    cat home.tar.split.* | tar -t > home_file_list.txt  
    cat home.tar.split.* | tar -d --directory /home tim > home_diff.txt  
    ls -l home.* > home_backup_files.txt

backup_home_exclude.txt  

    tim/work*  
    tim/.Trash*  
    tim/.thumbnails*  

This leaves me with a big pile of split files (named .aa, .ab etc) and a few text files. I proceeded to write 3 split files per disc, and put the 4 text files on every disc for convenience. I used gnome's built in DVD writing to create the discs.  

I also wanted to verify the md5 checksums as the discs were created, so I wrote another little script to make life easier. This ensures the newley written disc has been remounted properly, and runs the md5 check. So long as the 3 relevant checksums came out correctly on each disc I can be reasonably confident of recovering the data should I need it.  
"eject -t" closes the cdrom, which is handy.  

    reload_and_verify.sh  
    #!/bin/bash -v  
    cd /media  
    eject  
    eject -t  
    mount /media/cdrom  
    cd cdrom  
    md5sum -c home.md5  
    cd /media  
    eject  

In addition to the above mechanism (which is a pain at best, mostly due to media limitations) I keep my machines in sync with [unison](http://www.cis.upenn.edu/~bcpierce/unison/) which I strongly recommend for both technical and non-technical users. I gather it also runs on microsoft (who?), so you might find it useful if you are mid transition.
