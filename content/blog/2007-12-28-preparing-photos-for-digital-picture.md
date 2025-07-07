---
layout: post
title: Preparing photos for a digital picture frame
date: '2007-12-28T19:28:00.003Z'
author: Tim Abell
tags:
- photography
- howto
- ubuntu
- hardware
- linux
- script
- oss
modified_time: '2008-10-04T23:47:09.540Z'
blogger_id: tag:blogger.com,1999:blog-5082828566240519947.post-8312628495426408900
blogger_orig_url: https://timwise.blogspot.com/2007/12/preparing-photos-for-digital-picture.html
---

Challenge of the day was to fit as many photos as possible on a single flash
card to stick in a digital photo frame. Here's how it's done.

The frame from Philips goes by the memorable name of
[9FF2M4](http://www.consumer.philips.com/consumer/en/ca/consumer/cc/_productid_9FF2M4_37_CA_CONSUMER/)
, and by way of a quick review it is very nice. If I were a normal person, I
would probably have copied the original 2.5MB / 5 megapixel images to the
frame's flash card (1GB Compact Flash in this case, though it can take others),
and put up with not being able to fit *all* the photos on, and having some of them show sideways. But
being a perfectionist I instead sacrificed precious sleeping time to figure out
what to do. In the end I managed to trim the files down to around 200KB each,
and put portrait photos on a black background the right way up in order to save
neck ache from squinting at a sideways eiffel tower. This was all done by the
power of OSS and bash scripting. Here I present for your convenience the
methods I used, and highlight some of the useful things I picked up along the
way.

The first thing that taxed me was what size the photos needed to be to display
best whilst taking up minimal space. You would think the answer would be
emblazened on the product's box, but no! Philips don't seem to be too keen on
promoting the resolution of the display, and even the shop keeper struggled to
give me a number. The owner's manual states: "Resolution: 800 x 480 pixels
(viewing area 680 x 480)" but after some time experimenting with test images
created with [the gimp](http://gimp.org/) I came to the conclusion that it was
impossible to get the frame to display an image pixel perfect as it seemed to
be re-scaling every picture regardless of original size. There appears to be no
guidance from Philips as to what a good resolution for the photos would be, so
after some experimentation I settled on 800x600 as this is slightly higher than
the frame's native resolution, and fills the screen nicely without loosing too
much off the edges when displayed.

The frame does not appear to read orientation from the exif data so I looked
into rotating all the portrait images to display correctly. I am using the
frame in its landscape orientation as that is the form of most of the photos,
even though it can be placed in portrait orientation. When a portrait photos is
displayed (eg 480x600), the frame puts a fair amount of the image off the top
and bottom of the display, and by default puts it on a full white background
which is a little hard on the eyes and detracts from darker photos. I therefore
opted to create landscape images of 800x600 with a black background for all the
portrait photos. I later discovered that you can on this frame change the
background colour as follows: Main menu > Slideshow > Background colour > White
/ Black Grey.

The process I have used is a little specific to my setup and needs, but
hopefully will give you a good starting point. I have created 3 bash scripts
that call each other to orchestrate the conversion from my raw photo collection
to a new set suitable for the frame, which in turn make use of imageMagick and
exiftran to do the work.

I found out about [imageMagick](http://www.imagemagick.org/) through searching,
and tutorials such as [HowTo - Batch Image Resize on
Linux](http://www.smokinglinux.com/tutorials/howto-batch-image-resize-on-linux).
The version packaged with Ubuntu 7.10 is quite old, so I ended up building and
installing the latest version (6.3.7) from source to get all the functionality
I needed.

`exiftran` is a nifty utility that reads the exif orientation information in a
photo, losslessly rotates the photo to match and then updates the exif data. It
is closely related to `jpegtran`.

My folder structure in my home folder (so the scripts make sense):

*   scripts (for bash scripts)
*   photos (originals)
    *   2005
        *   2005-12-31 event name
        *   etc
    *   2006
        *   etc
*   photos_frame (for the modified and shrunk photos which will be copied onto the flash card)

So without further ado, here's the scripts:

**frame.sh** - runs the processing scripts on each year folder of interest

    #!/bin/bash -v
    ~/scripts/frame_photo_folder.sh 2005 ~/photos_frame/
    ~/scripts/frame_photo_folder.sh 2006 ~/photos_frame/
    ~/scripts/frame_photo_folder.sh 2007 ~/photos_frame/

**frame_photo_folder.sh** - runs the processing script on subfolder of the year

    #!/bin/bash
    #arg 1 = input folder
    #arg 2 = output folder

    INPUTPATH=$1
    OUTPATH=$2
    cd $INPUTPATH
    if [ ! -d "$OUTPATH$INPUTPATH" ]
    then
    echo creating output folder \"$OUTPATH$INPUTPATH\"
    mkdir $OUTPATH$INPUTPATH
    fi
    for fname in *
    do
    if [ -d "$fname" ]
    then
    if [ ! -d "$OUTPATH$INPUTPATH/$fname" ]
    then
    echo creating output folder \"$OUTPATH$INPUTPATH/$fname\"
    mkdir "$OUTPATH$INPUTPATH/$fname"
    fi
    echo searching for jpg files in \"$fname\"
    cd "$fname"
    find . -maxdepth 1 -type f -name \*.JPG | xargs -iimgfile ~/scripts/frame_photo.sh "imgfile" "$OUTPATH$INPUTPATH/$fname"
    cd ..
    fi
    done


**frame_photo.sh**

*   creates output folder(s)
*   copies original photo into output folder
*   uses exiftran to rotate the photo to the correct orientation
*   shrinks the photo to a maximum of 800x600, and fills any remaining space with a black background

```
#!/bin/bash

#arg 1 = photo file name
#arg 2 = where to put result
#resizes and pads suitable for a photo frame.

INPUTFILE=$1
OUTPATH=$2
#pwd
echo copying \"$INPUTFILE\" into \"$OUTPATH\"
cp "$INPUTFILE" "$OUTPATH"
cd "$OUTPATH"
#pwd
#echo processing \"$INPUTFILE\"
exiftran -ai "$INPUTFILE"
convert "$INPUTFILE" -resize '800x600>' -background black -gravity center -extent 800x600 "$INPUTFILE"
```

I timed the whole operation using the time command, and copied all output to a
log file as follows.

    $ time ./frame.sh 2>&1 | tee frame.log

The conversion of around 6000 photos took around one and a half hours.

The concept of redirection of stdout & stderr was neatly explained by the
article [CLI magic: need redirection?](http://www.linux.com/articles/113686),
so now I know that 2>&1 means redirect ouput number two into output number one,
in other words redirect stderr into stdout, which then alows you to pipe the
whole lot into something else like "tee" (No, not tea, though it may be
interesting redirecting my photos into my tea...)

Add a comment or drop me a line if you find it interesting or useful or if you
have any questions or criticisms.

Update: I've worked this script into a small python gui app, check it out at
[http://github.com/timabell/photo-frame-prep](http://github.com/timabell/photo-frame-prep)
