---
layout: post
title: LVM + ReiserFS for the win
date: '2011-10-25T06:17:00.002Z'
author: Tim Abell
tags:
- howto
- ubuntu
- linux
- lvm
modified_time: '2011-10-25T06:20:59.060Z'
blogger_id: tag:blogger.com,1999:blog-5082828566240519947.post-149678347610055760
blogger_orig_url: https://timwise.blogspot.com/2011/10/lvm-reiserfs-for-win.html
---

LVM + ReiserFS for the win!

It's so easy to add more space

```
root@atom:~
# lvextend -L +100G /dev/vg2/local
 Extending logical volume local to 200.00 GiB
 Logical volume local successfully resized
root@atom:~
# resize_reiserfs /dev/vg2/local
resize_reiserfs 3.6.21 (2009 www.namesys.com)

resize_reiserfs: On-line resizing finished successfully.
root@atom:~
# df -h /dev/mapper/vg2-local
Filesystem            Size  Used Avail Use% Mounted on
/dev/mapper/vg2-local
                     200G   18G  183G   9% /media/local
root@atom:~
```
