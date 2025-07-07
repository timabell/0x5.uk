---
layout: post
title: Enabling TV-Out on Ubuntu Linux 7.10 on a Dell Inspiron 8500
date: '2007-12-09T01:41:00.001Z'
author: Tim Abell
tags:
- howto
- nvidia
- inspiron 8500
- ubuntu
- hardware
- composite video
- linux
- dell
- laptop
- proprietary
- oss
modified_time: '2007-12-09T03:13:46.284Z'
thumbnail: http://farm3.static.flickr.com/2419/2096850378_d98545fdc9_t.jpg
blogger_id: tag:blogger.com,1999:blog-5082828566240519947.post-8211898069521983285
blogger_orig_url: https://timwise.blogspot.com/2007/12/enabling-tv-out-on-ubuntu-linux-710-on.html
---

This weekend, I finally got the tv-out working under linux (Ubuntu 7.10 aka
gusty gibbon) on my laptop. Here's what was involved, including some of the
(time consuming) red herrings involved in getting this set up.

[![](/assets/inspiron-tv-out.jpg)](http://www.flickr.com/photos/tim_abell/2096850378/)

I've included the full `xorg.conf` files for normal display and tv output at
the end of this post.

I used the composite video output as that's what I have cables for. I haven't
ever tried the s-video output, and I haven't tried the digital audio output
since I divorced microsoft windows and threw her things out into the rain a
couple of years ago.

The quality is pretty poor, but good enough. I think there's a limit of 800x600
for the video out. I'm getting a fair amount of interference on both the video
and audio when the laptop is on mains and connected to my amplifier / tv. I'm
not sure what the cause it but it's not bad enough to be unusable.

I installed the nvidia proprietary (that's a negative word in case you don't
live in my world) drivers some time ago in order to get 3D acceleration, and I
think this is a prerequisite to running the tv-out.

In my intial investigation I came across
[nvoption](http://www.sorgonet.com/linux/nvoption/), which in theory allows you
to turn on the tv-out on the nvidia cards. I did manage to compile and run it
after several hours of trial, error and finding build dependencies but when I
finally got it built and running I found that it would seg fault when I hit the
"apply" button, hurrah! In the process of playing with nvoption however, I
noticed the [nv-online](http://www.sorgonet.com/linux/nv-online/) page that
this person has very generously set up. Reading this it dawned on me that
nvoption purely modifies the /etc/X11/xorg.conf file, and that I don't actually
*need* the tool to get tv-out running. I had originally presumed (the brother
of all ...) that the nvoption tool did some magical proprietary prodding of the
graphics card directly. After a bit of searching to find out where the options
should go (the device section), I was then able to use the [documentation of
options](http://www.sorgonet.com/linux/nv-online/help.html) in the second frame
of the nv-online page to configure my own X. After a bit of experimenting with
different options and lots of restarting of the X server (ctrl+alt+backspace) I
was able to get the desired result of the display mirrored/cloned on both the
lcd and the television.

I tried the nvidia-settings gui tool that comes with the proprietary drivers,
but it was no use for this task. This tool modifies the xorg.conf file. It did
help me recently with a normal dual screen setup (using a crt monitor plugged
into the vga port on the laptop), but it was no help for the tv-out, which was
not even mentioned in the interface.

There is a tool called displayconfig-gtk which is fairly new to Ubuntu that
allows you to save named display profiles for different configurations
(including dual screen, though it didn't quite behave for me). It can be found
under System > Administration > Screens and Graphics. This stores an xorg.conf
file for each profile in /var/lib/displayconfig-gtk/locations/, and an index
file in /var/lib/displayconfig-gtk/locations.conf. This is almost ideal, as I
have created a set of xorg.conf files for my various setups, however it doesn't
seem to cope with applying these custom xorg files. Additionally nvidia seem to
have a weird way of setting the screen to run at its native resolution of
1920x1600, and this tool doesn't cope with it. This was corrected by selecting
the right resolution under System > Preferences > Screen Resolution.

Sadly it looks like there are no tools for easy switching X configuration
files, so the process for now is involves manually copying the config files.
I've created multiple files in /etc/X11, one for each set up including
xorg.conf_lcd and xorg.conf_tv. The switching process is then something along
the lines of "cd /etc/X11/", "sudo cp xorg.conf_tv xorg.conf",
ctrl+alt+backspace (restart x server).

If it's any consolation I recall the process in windows involved starting from
scratch in a distinctly non-intuitive gui and trying to get a whole load of
settings just right, so being able to save the settings is a big step up. I
think it took similar amounts of time to get tv-out running under windoze. I
guess that's the price we pay for allowing companies to deny us access to the
hardware specs so it can be integrated properly. I bought this laptop before I
knew how much control I was giving away, and I endeavour not to make such
mistakes these days.

The "designed for windows xp" sticker has been moved to the equally shiny
microwave oven which brings me a small piece of joy when I make porridge in the
morning.

# xorg.conf for just the laptop screen

```
# nvidia-settings: X configuration file generated by nvidia-settings
# nvidia-settings: version 1.0 (buildmeister@builder3) Mon Apr 16 20:38:05 PDT 2007

Section "ServerLayout"
Identifier "Layout0"
Screen 0 "Screen0" 0 0
InputDevice "Keyboard0" "CoreKeyboard"
InputDevice "Mouse0" "CorePointer"
Inputdevice "Synaptics Touchpad"
EndSection

Section "Files"
RgbPath "/usr/X11R6/lib/X11/rgb"
EndSection

Section "Module"
Load "dbe"
Load "extmod"
Load "type1"
Load "freetype"
Load "glx"
EndSection

Section "ServerFlags"
Option "Xinerama" "0"
EndSection

Section "InputDevice"
# generated from default
Identifier "Mouse0"
Driver "mouse"
Option "Protocol" "auto"
Option "Device" "/dev/psaux"
Option "Emulate3Buttons" "no"
Option "ZAxisMapping" "4 5"
EndSection

Section "InputDevice"
Identifier "Synaptics Touchpad"
Driver "synaptics"
Option "SendCoreEvents" "true"
Option "Device" "/dev/psaux"
Option "Protocol" "auto-dev"
Option "HorizScrollDelta" "0"
EndSection

Section "InputDevice"
# generated from default
Identifier "Keyboard0"
Driver "kbd"
EndSection

Section "Monitor"
# HorizSync source: edid, VertRefresh source: edid
Identifier "Monitor0"
VendorName "Unknown"
ModelName "Sharp"
HorizSync 30.0 - 75.0
VertRefresh 60.0
Option "DPMS"
EndSection

Section "Device"
Identifier "Videocard0"
Driver "nvidia"
VendorName "NVIDIA Corporation"
BoardName "GeForce4 4200 Go"
EndSection

Section "Screen"
Identifier "Screen0"
Device "Videocard0"
Monitor "Monitor0"
DefaultDepth 24
Option "metamodes" "DFP: nvidia-auto-select +0+0"
SubSection "Display"
Depth 24
Modes "1600x1200" "1280x1024" "1024x768" "800x600" "640x480"
EndSubSection
EndSection
```

# xorg.conf for running the tv-out at 800x600, with the laptop displaying the same

```
# nvidia-settings: X configuration file generated by nvidia-settings
# nvidia-settings: version 1.0 (buildmeister@builder3) Mon Apr 16 20:38:05 PDT 2007

Section "ServerLayout"
Identifier "Layout0"
Screen 0 "Screen0" 0 0
InputDevice "Keyboard0" "CoreKeyboard"
InputDevice "Mouse0" "CorePointer"
Inputdevice "Synaptics Touchpad"
EndSection

Section "Files"
RgbPath "/usr/X11R6/lib/X11/rgb"
EndSection

Section "Module"
Load "dbe"
Load "extmod"
Load "type1"
Load "freetype"
Load "glx"
EndSection

Section "ServerFlags"
Option "Xinerama" "0"
EndSection

Section "InputDevice"
# generated from default
Identifier "Mouse0"
Driver "mouse"
Option "Protocol" "auto"
Option "Device" "/dev/psaux"
Option "Emulate3Buttons" "no"
Option "ZAxisMapping" "4 5"
EndSection

Section "InputDevice"
Identifier "Synaptics Touchpad"
Driver "synaptics"
Option "SendCoreEvents" "true"
Option "Device" "/dev/psaux"
Option "Protocol" "auto-dev"
Option "HorizScrollDelta" "0"
EndSection

Section "InputDevice"
# generated from default
Identifier "Keyboard0"
Driver "kbd"
EndSection

Section "Monitor"
# HorizSync source: edid, VertRefresh source: edid
Identifier "Monitor0"
VendorName "Unknown"
ModelName "Sharp"
HorizSync 30.0 - 75.0
VertRefresh 60.0
Option "DPMS"
EndSection

Section "Device"
Identifier "Videocard0"
Driver "nvidia"
VendorName "NVIDIA Corporation"
BoardName "GeForce4 4200 Go"
**Option "TwinView" "1"
Option "TwinViewOrientation" "Clone"
Option "MetaModes" "800x600, 800x600;"
Option "TVStandard" "PAL-I"
Option "ConnectedMonitor" "DFP,TV"**
EndSection

Section "Screen"
Identifier "Screen0"
Device "Videocard0"
Monitor "Monitor0"
DefaultDepth 24
#Option "metamodes" "DFP: nvidia-auto-select +0+0"
SubSection "Display"
Depth 24
Modes "1600x1200" "1280x1024" "1024x768" "800x600" "640x480"
EndSubSection
EndSection
```
