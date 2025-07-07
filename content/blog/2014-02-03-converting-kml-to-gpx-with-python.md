---
layout: post
title: Converting kml to gpx with python
date: '2014-02-03T20:27:00.000Z'
author: Tim Abell
tags:
modified_time: '2014-02-03T20:29:19.425Z'
blogger_id: tag:blogger.com,1999:blog-5082828566240519947.post-6598892897913494731
blogger_orig_url: https://timwise.blogspot.com/2014/02/converting-kml-to-gpx-with-python.html
---

Today I wanted to geo-code some of my photos.

I have an SLR digital camera (no gps of course), and an android phone. I
recorded a track with [My
Tracks](https://play.google.com/store/apps/details?id=com.google.android.maps.mytracks)
from google on the phone. (Not entirely recommended but works). I then fired up
digikam to run the geo-correlation and add lat-long to the exif of the files
only to discover [digikam doesn't know how to read
kml](http://community.kde.org/Digikam/GSoC2010/ReverseGeocoding#TODO_Later_versions).
Fooey.

<div class="flickr-pic">
<a href="https://www.flickr.com/photos/tim_abell/12293521763/"><img
src="https://live.staticflickr.com/3756/12293521763_39d7704c73_k.jpg" alt="people on the beach"></a>
</div>

I looked to gpsbabel, but it apparently can't handle this style of kml file, as
differentiated by the coordinates being in the following style of markup:

    <gx:Track>
    <when>2014-01-25T18:00:13.955Z</when>
    <gx:coord>-1.885348 50.769434</gx:coord>
    <when>2014-01-25T18:00:14.565Z</when>
    <gx:coord>-1.885193 50.769328 53.20000076293945</gx:coord>
    <when>2014-01-25T18:00:58.566Z</when>

So I wrote a python script to munge it into gpx shape:

<script src="https://gist.github.com/timabell/8791116.js"></script>

This can be run as follows:

    ./kmlToGpx.py "25-01 12-48.kml" > "25-01 12-48.kml.gpx"

And worked a treat for me.

After I'd done this I discovered my pet tool
[gpsprune](http://activityworkshop.net/software/gpsprune/index.html) can open
the new style kml. (I [forked gpsprune](https://github.com/timabell/gpsprune) a
while ago and added a minor feature) However I'm glad to have a command-line
tool as I have hundreds of tracks I want to convert.

Incidentally the phone can automatically sync the tracks to google drive, which
is kinda handy and then you can download them from the site etc.
