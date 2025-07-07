---
layout: post
title: My Screencasting Setup
date: 2018-03-17 18:56:12.000000000 +00:00
type: post
published: true
status: publish
permalink: "/2018/03/17/screencasting-setup/"
---
I just made a video to demo schema explorer.

<iframe width="560" height="315" src="https://www.youtube.com/embed/cqStb6M-Q90" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

I did this in one take with no post-production work. I figure practice will improve my selection and delivery of the content.

Behind the scenes I used the following:

## Hardware

*   Dell XPS 13 - (9350 model), using the built-in webcam (up-nose view, camera in bottom left of lid for some reason), good enough for tiny pic in corner.
*   [Snowball usb mic](http://amzn.to/2FGWsQQ) (great sound quality, no worrying about analogue stuff), sat on a folded towel on my desk to deaden vibrations through the mini-tripod. The snowball has 3 settings on a switch at the back, had it on 3 - omni directional, I tested [all three modes](https://youtu.be/-3rbPaJgTWA?t=1m59s) beforehand.
*   Supplied stand didn't actually fit properly, so bought an [ammoon mini tripod](http://amzn.to/2pkYEmg) instead which is lovely (importantly it has the right screw thread for the mic).
*   A quiet room after everyone is in bed to avoid [interruptions](https://youtu.be/Mh4f9AYRCZY), and did the recording between rain storms!

## Software

*   [Linux Mint](https://linuxmint.com/) 18.3 Cinnamon
*   [Vokoscreen](http://linuxecke.volkoh.de/vokoscreen/vokoscreen.html) 2.4.0 - this handles screen recording & the picture-in-picture from the webcam

I recorded the entire screen at 1920x1080 (seeing as even phones are HD now). and uploaded it to youtube. (drag-n-drop, simplez!)

## Settings

Control panel > sound > input > snowball > about 130% input volume

![Sound_183.png]({{ site.baseurl }}/assets/sound_183.png)

fullscreen capture, display 2, 1920x1080

![Screenshot from 2018-03-17 18-27-39.png]({{ site.baseurl }}/assets/screenshot-from-2018-03-17-18-27-39.png)

pulse / blue-snowball selected

![Screenshot from 2018-03-17 18-27-55.png]({{ site.baseurl }}/assets/screenshot-from-2018-03-17-18-27-55.png)

mpeg4, mp3, avi, 25fps

![vokoscreen 2.4.0_180]({{ site.baseurl }}/assets/vokoscreen-2-4-0_180.png)

Default config apart from save path "videopath"

![vokoscreen 2.4.0_181.png]({{ site.baseurl }}/assets/vokoscreen-2-4-0_181.png)

Webcam switched on

![vokoscreen 2.4.0_182.png]({{ site.baseurl }}/assets/vokoscreen-2-4-0_182.png)

## Other attempts

I spent ages finding the right software and doing test takes to get sound levels etc right.

I started off with Kazaam for recording and mplayer for the webcam onscreen video.

I got mplayer to show a borderless webcam video picture on screen that I could then use with any screen recorder, but had problems with dual screen behaviour so even though I could zoom in better I gave up on that once I'd discovered vokoscreen.

You might also want to look at [https://wistia.com/soapbox](https://wistia.com/soapbox) which I hear is very good.
