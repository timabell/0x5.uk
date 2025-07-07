---
layout: post
title: compiling partimage
date: '2007-03-26T23:06:00.000Z'
author: Tim Abell
tags:
- partimage
- dev
- project
modified_time: '2007-03-26T23:32:22.663Z'
blogger_id: tag:blogger.com,1999:blog-5082828566240519947.post-5549746669475271810
blogger_orig_url: https://timwise.blogspot.com/2007/03/compiling-partimage.html
---

Had a problems getting partimage to compile on one of my pcs from a fresh checkout.  

    svn co https://partimage.svn.sourceforge.net/svnroot/partimage/trunk/partimage partimage  

The ./autogen.sh script was failing as follows  

    tim@lap:~/projects/partimage$ ./autogen.sh  
    Running "autoreconf -vif" ...  

    autoreconf: Entering directory .'  
    autoreconf: running: autopoint --force  
    autoreconf: running: aclocal -I m4 --output=aclocal.m4t  
    autoreconf: aclocal.m4' is unchanged  
    autoreconf: configure.ac: tracing  
    autoreconf: running: libtoolize --copy --force  
    autoreconf: running: /usr/bin/autoconf --force  
    autoreconf: running: /usr/bin/autoheader --force  
    autoreconf: running: automake --add-missing --copy  
    configure.ac: 16: required file ./[config.h].in' not found  
    Makefile.am:1: AM_GNU_GETTEXT in configure.ac' but intl' not in SUBDIRS  
    automake: Makefile.am: AM_GNU_GETTEXT in configure.ac' but ALL_LINGUAS' not defined  
    autoreconf: automake failed with exit status: 1  
    Done.  

Barked up lots of wrong trees, including looking for missing libraries, gettext config etc.  

Turned out to be an old version of automake.  

Not sure how my other pc ended up with the right version, but this pc's version was:  

    $ automake --version  
    automake (GNU automake) 1.4-p6  

Installing new version (with some help from command line auto-completion):  

    $ apt-get install automake_[tab]_  
    automake automake1.5 automake1.8  
    automake1.4 automake1.6 automake1.9  
    automake1.4-doc automake1.7 automaken  

    $ sudo apt-get install automake1.9  
    ...  
    $ automake --version  
    automake (GNU automake) 1.9.6  

After updating automake, the ./autogen.sh script ran, and I could then run ./configure and make successfully, and was left with a binary for partimage in src/client/  

Hurrah.  

The solution came from a post by Tibor Simko on cdsware.cern.ch:  

> [Re: problem with autoreconf when installing from cvs](http://cdsware.cern.ch/lists/project-cdsware-users/archive/msg00694.shtml)  
>   
> * From: Tibor Simko<tibor.simko@xxxxxxx>  
> * Subject: Re: problem with autoreconf when installing from cvs  
> * Date: Thu, 18 Jan 2007 18:12:20 +0100  
>   
> Hello:  
>   
> On Thu, 18 Jan 2007, robert forkel wrote:  
>   
> > $ autoreconf  
> > Makefile.am:23: AM_GNU_GETTEXT in configure.ac' but intl' not in SUBDIRS  
> > automake: Makefile.am: AM_GNU_GETTEXT in configure.ac' but  
> > ALL_LINGUAS' not defined  
>   
> Which version numbers of automake, autoconf, and gettext do you have?  
> E.g. automake versions prior to 1.9 and gettext versions prior to 0.14  
> will not work.  
>   
> Best regards  
> --  
> Tibor Simko</tibor.simko@xxxxxxx>
