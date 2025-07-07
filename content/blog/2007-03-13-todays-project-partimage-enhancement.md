---
layout: post
title: Today's project - partimage enhancement
date: '2007-03-13T22:01:00.000Z'
author: Tim Abell
tags:
- partimage
- dev
- linux
- oss
- project
modified_time: '2007-03-13T22:27:10.644Z'
blogger_id: tag:blogger.com,1999:blog-5082828566240519947.post-6030191776095000293
blogger_orig_url: https://timwise.blogspot.com/2007/03/todays-project-partimage-enhancement.html
---

*me and [partimage](http://www.partimage.org/)*

I recently reorganised the partitions on my laptop, with the help of some
invaluable OSS tools.

The laptop was split into OS partitions, with a data and swap partition at the
end, but I'd starting running out of space. I have since made ubuntu my only OS
at home, so no longer require multiple partitions.  My partition table ended up
looking something like this: *data | OS | more data | swap*, and I wanted it to
look like this: *OS & data | swap*, but without having to rebuild (again).

With another linux box available with bags of disc space, I did something like the following:

*   from each data partition and my home folder: `tar -cv datafolder | ssh
    otherbox "cat > laptop/datafolder.tar"`, which gave me a tarball of all my
    data
*   boot into knoppix 4
*   use partimage to save os parition image into filesystem of another
    partition
*   `scp osimage.img otherbox:laptop/`
*   `fdisk` to set up new partitions
*   pipe the image back into partimage across the wire: `ssh otherbox "cat
    laptop/osimage.img" | partimage ....` plus some flags for batch writing to
    new partition
*   use parted (partition editor) to stretch partition image back up to full
    size of new partition.
*   fix grub with help from knoppix - `hda(0,2)` to `hda(0,0)` or something.
*   remove references to non existent partitions from fstab

Which was all great, but I feel there's a feature missing from partimage.
Although it can read an image from stdin for writing to disc, it can't write an
image to stdout from disc. This would have saved me some thinking and some
hassle. So in the true spirit of OSS, I shall have a go at adding the
functionality.

So far, I have grabbed the source from sourceforge's svn server, managed to
compile the source (after being confused by a misleading error message) and
installed an IDE. I started with Eclipse, as I've been using it a bit recently
and really like it, but figure that perhaps the C++ devs aren't likely to be
java fans and maybe they would choose something else. So I've installed
KDevelop, and will be having a go with that.
