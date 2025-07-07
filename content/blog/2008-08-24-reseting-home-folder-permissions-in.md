---
layout: post
title: reseting home folder permissions in ubuntu linux
date: '2008-08-24T15:03:00.006Z'
author: Tim Abell
tags:
- howto
- ubuntu
- linux
- script
- bash
- sys admin
modified_time: '2014-08-27T18:59:53.163Z'
blogger_id: tag:blogger.com,1999:blog-5082828566240519947.post-7821587094191713961
blogger_orig_url: https://timwise.blogspot.com/2008/08/reseting-home-folder-permissions-in.html
---

If you are like me and my coworkers, you often end up running stuff as root in
your home folder and end up not able to access your own files.

For the record, here's the commands to reset the permissions (leaving all execute flags off, which may not be what you want).

Warning, this could have undesired side effects. If you have executable files in your home folder that you actually want to be executable, you will have to manually mark them as executable again.

```
# Become root (as you don't currently have permissions to modify your own files)
sudo -i

# Reset ownership & group to yourself
chown -R tim:tim /home/tim

# give yourself the default read-write permissions, set group and other to read only
chmod -R 644 /home/tim

# re-apply excecute permissions on all the directories
find /home/tim -type d -print0 | xargs -0 -II chmod 755 'I'

# Don't leave your private keys showing:
chmod -R 700 /home/tim/.ssh
```

My latest use for this was after extracting files from my p910i with p3nfs,
which as with so many desktop/device tasks needed root to work.

<div class="flickr-pic">
<a href="https://www.flickr.com/photos/tim_abell/2792157421/"><img
src="https://live.staticflickr.com/3226/2792157421_2b8a33c6c6.jpg" alt="Photo of stained class at Guilford Catherdral"></a>
</div>

You could do this slightly more neatly if you know what permissions you have
ended up with by using `chmod u+w` etc so you don't have to re-apply directory
permissions, but I wanted to easily guarantee permissions are right regardless
of what state they have ended up in.

It occurs to me it might be sensible to set the sticky bit on the home folders
so that anything added by root stays owned by the user. (`chmod u+s g+s
/home/tim`)
