---
layout: post
title: backing up Vista
date: '2009-12-18T10:08:00.002Z'
author: Tim Abell
tags: 
modified_time: '2009-12-18T11:57:06.028Z'
blogger_id: tag:blogger.com,1999:blog-5082828566240519947.post-7478677393110232279
blogger_orig_url: https://timwise.blogspot.com/2009/12/backing-up-vista.html
---

So here's a tale of annoying things.  

I generally try and avoid running anything proprietary at home, and especially anything from Microsoft. But for reasons beyond my control a copy of Vista has embedded itself in our household.  

For my linux backups I've settled on [dar](http://dar.linux.free.fr/) (Disk ARchiver) + [dargui](http://dargui.sourceforge.net/) as it applies the keep it simple rule (certainly in comparison with a lot of other tools I tried, such as the ubuntu default "home user backup" tool, which has a simple ui but offers limited control and I'm not sure how easily I could recover files from it in a disaster). Dar is like tar (Tape ARchiver) but more designed with backup to disk in mind, which is what I was after in order to backup to [usb hdd](http://www.ebuyer.com/product/178934), and most importantly does incremental/differential backups the way I want.  

So then I came to back up this Vista home directory (sorry, Users directory / profiles). I have disliked the old fashioned microsoft backup files (.bkf) from Windows XP and before ever since I tried to get files out of one from a Linux box. Turns out it's not exactly the best supported format. I didn't have much luck with [mtftar](http://freshmeat.net/projects/mtftar/). It seems Microsoft have produced a replacement ([plus ça change](http://en.wiktionary.org/wiki/plus_%C3%A7a_change,_plus_c%27est_la_m%C3%AAme_chose)) to the old windows backup that is evidently designed to be [simple](http://dictionary.reference.com/browse/simple "lacking mental acuteness or sense"), which has very strange ideas about how you might want to back up your pc. It seems keener to back up the sample image files from the office install than than the user's photos. I very quickly fell out with this tool and moved on.  

Some people might recommend windows home server, but I am not about to _pay_ for more shoddy Microsoft software in order to solve problems created by other shoddy Microsoft software. Vote with your wallet, as they say.  

So next on the list, remote backup from a linux box. [backup pc](http://backuppc.sourceforge.net/) looked great, and has many nifty features, however having got it all set up I got permissions errors in the My Documents etc folders, which are the important ones. I tried different user permissions for the backup user, and different group memberships, though stopped short of resetting all user directory permissions so as to not break anything but couldn't get past these errors. More details on that attempt in my [backuppc and windows vista](http://timwise.blogspot.com/2009/10/backuppc-and-windows-vista.html) blog entry. There is a hint in the [Robocopy wikipedia](http://en.wikipedia.org/wiki/Robocopy) that there is some special mode needed to be able to get past these permissions issues.

> "The so-called Backup mode is an administrative privilege that allows Robocopy to override permissions settings (specifically, NTFS ACLs) for the purpose of making backups."

But I didn't get any further than that.  

So finally I come to the conclusion that Vista just doesn't want you to do backups without paying microsoft more money, and that they have forgotten or never knew the [KISS](http://en.wikipedia.org/wiki/KISS_principle) mantra that makes *nix such a pleasure to work with. (Rather opting for their usual "making simple things easy and difficult things impossible".)  

It was [Linux Format 127 Ubuntu 9.10 Cover Disc](http://www.linuxformat.co.uk/archives?issue=127) that came to the rescue. Popped the disc in,rebooted, connected my usb hdd (formatted with ext3 of course), ran `apt-get install dar`, opened the disk icon on the desktop representing the evil vista installation partition on the local disk (to get it mounted), opened the usb hdd disk icon (also to get it mounted), then ran `dar -c /media/usbhdd/backups/vistargh -z` from the directory /media/vista/Users/. This ran fine and I was able to read the file from a better operating system with no issues.
