---
layout: post
title: stop motion animation on linux
date: '2008-03-27T21:29:00.007Z'
author: Tim Abell
tags:
- photography
- howto
- animation
- linux
modified_time: '2011-04-24T07:58:44.332Z'
blogger_id: tag:blogger.com,1999:blog-5082828566240519947.post-4371985220813850741
blogger_orig_url: https://timwise.blogspot.com/2008/03/stop-motion-animation-on-linux.html
---

A quick howto...

1.  Take a series of photos on your digital camera.
2.  Copy them onto your linux box.
3.  shrink the photos to a more managable size:
    `mogrify -verbose -resize 600x400 -quality 60% *.JPG`
4.  Preview the animation with animate:
    `animate -delay 8 *`
5.  Optionally rotate the image to match the exif information from your camera (mine was sideways):
    `exiftran -ai *`
6.  Convert the jpg files to png:
    mogrify -format png *.JPG
7.  Create the flash animation from the PNG files:
    `png2swf -r 15 -o flower2.swf -v -X 399 -Y 600 *.png`
8.  Create an html file to hold the animation containing the following:
    ```
    <object>
    <param name="movie" value="flower2.swf" />
    <param name="loop" value="true" />
    <param name="quality" value="high" />
    <embed src="flower2.swf" width="399" height="600" />
    </object>
    ```
9.  Write a blog article to tell everyone about it ;-)
    "history" is a handy command for reviewing your activities for writing up your achievements.

And here it is, providing I've kept up with my hosting fees and not been slashodotted:

<div style="padding: 1em; border: 2px solid black;">
<object>
<param name="movie" value="http://timwise.co.uk/photos/flower2.swf">
<param name="loop" value="true">
<param name="quality" value="high">
<embed src="https://raw.githubusercontent.com/timabell/timwise.co.uk/master/assets/flower2.swf" width="399" height="600">
</object>
</div>

Update, that was an embedded flash file ^ which isn't really a thing on the internet any more.

The original flash file: [flower2.swf](https://raw.githubusercontent.com/timabell/timwise.co.uk/master/assets/flower2.swf)
