---
layout: post
title: My bash prompt
date: '2008-03-31T21:37:00.007Z'
author: Tim Abell
tags:
- ubuntu
- linux
- bash
modified_time: '2008-04-26T13:50:39.053Z'
blogger_id: tag:blogger.com,1999:blog-5082828566240519947.post-3985300694543528147
blogger_orig_url: https://timwise.blogspot.com/2008/03/my-bash-prompt.html
---

I like a new line in my prompt so that if I'm deep in a path I don't end up
with 10 characters left to type in, and pretty colours so that it's easy to
spot the prompt when scrolling through lots of output.

Update 26/04/2008, added red for root.

From my `~/.bashrc`

    # Comment in the above and uncomment this below for a color prompt
    if [ $UID = 0 ] ;then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[00;31m\]\u@\h\[\033[00m\]:\[\033[00;34m\]\w\[\033[00m\]\n\$ '
    else
    PS1='${debian_chroot:+($debian_chroot)}\[\033[00;32m\]\u@\h\[\033[00m\]:\[\033[00;34m\]\w\[\033[00m\]\n\$ '
    fi

The result (more or less):

<div>
<code>
<span style="color: rgb(0, 153, 0);">tim@lap</span>:<span style="color: rgb(102, 0, 204);">~/Documents</span>
$ echo "That's better"
</code>
</div>

Enjoy.
