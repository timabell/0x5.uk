---
layout: post
title: Running IE Application Compatibility VPC under Virtual Box
date: '2012-04-18T21:59:00.005Z'
author: Tim Abell
tags:
- virtualbox
- workaround
- vpc
- windows
- linux
modified_time: '2013-09-09T19:58:02.140Z'
thumbnail: http://2.bp.blogspot.com/-6nGRU7FIXbw/T487RpEWm5I/AAAAAAAAAE0/TPYAZzmUYy8/s72-c/sata-controller.png
blogger_id: tag:blogger.com,1999:blog-5082828566240519947.post-1232309832274484466
blogger_orig_url: https://timwise.blogspot.com/2012/04/running-ie-application-compatibility.html
---

This post is no longer necessary as microsoft now provide official virtualbox
images, yay!
[http://www.modern.ie/en-us/virtualization-tools#downloads](http://www.modern.ie/en-us/virtualization-tools#downloads)

----

Microsoft provide Virtual PC images for testing your website with IE. You can
download them from
[http://www.microsoft.com/download/en/details.aspx?id=11575](http://www.microsoft.com/download/en/details.aspx?id=11575)

Note that the XP image has no expired so is no use, it will reboot immediately
after login.

I wanted to make use of the Win 7 / IE 9 image, however Virtual PC is
unavailable on Linux. Fortunately VirtualBox can mount Virtual PC's disk
images.

For me the image would get half way through booting windows, and then
blue-screen (BSOD). I discovered that it was possible to get past this by
removing the SATA controller the machine's settings, and instead adding the
disk under the IDE controller. After that the machine booted successfully.

![](/assets/sata-controller.png)

* * *

Capturing the BSOD, basically press F8 after a lot rebooting, and select
"disable automatic restart on system failure" (ref:
[http://www.webtlk.com/2009/07/02/how-to-stop-windows-7-reboot-loop/](http://www.webtlk.com/2009/07/02/how-to-stop-windows-7-reboot-loop/))

![](/assets/bsod-reboot-prevention-F8.png)

![](/assets/bsod.png)
