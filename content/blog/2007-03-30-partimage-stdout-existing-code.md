---
layout: post
title: partimage + stdout, existing code
date: '2007-03-30T00:09:00.000Z'
author: Tim Abell
tags:
- partimage
- dev
- project
modified_time: '2007-03-30T00:31:05.036Z'
blogger_id: tag:blogger.com,1999:blog-5082828566240519947.post-5846736757234824293
blogger_orig_url: https://timwise.blogspot.com/2007/03/partimage-stdout-existing-code.html
---

On first inspection it looks like some code already exists for writing an image to stdout (standard output).  

[image_disk.cpp, line 558](http://partimage.svn.sourceforge.net/viewvc/partimage/trunk/partimage/src/shared/image_disk.cpp?revision=1&view=markup&pathrev=20#l_558)  

      if (strcmp(m_szImageFilename, "stdout"))    {      //... network output code hidden for clarity ...    }  else // it's stdout    {      m_fImageFile = stdout;      showDebug(1, "image will be on stdout\n");    }

Unlike stdin for restore, stdout for save is not currently available in the command line options. I did do a build earlier where I enabled it (which I don't have any more due to my build problems). I managed to pipe an image to hexdump and seemed to be able to see some of the user interface info in the output.  

It would seem the problem with the stdout option is that even in batch mode the program outputs interface data to stdout, which then corrupts the image.  

I think I shall attempt to remove all the UI stuff, and make it act more like all the other unix tools. Might also try to create a reusable library out of it.
