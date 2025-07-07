---
layout: post
title: Building a Windows 10 Development VM from scratch
date: 2018-04-01 20:10:54.000000000 +01:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
author:
  login: timabell
  email: tim@timwise.co.uk
  display_name: timabell
  first_name: ''
  last_name: ''
permalink: "/2018/04/01/building-a-windows-10-development-vm-from-scratch/"
---

Rebuilding windows dev VM from scratch, reminds me why people put up an old build for so long. What a painful process!

I did wonder if I could get away with mssql on linux, and tried the [mssql docker image, which hosed my linux kernel](https://github.com/Microsoft/mssql-docker/issues/284). That's too many yaks for one morning.

## Windows Install

Download a virtualbox image from <https://developer.microsoft.com/en-us/windows/downloads/virtual-machines/>

- Attach the vm disk in virtualbox
- Fire up and run updates
- Install Rider via jetbrains toolbox
- Shut down the VM
- Take a virtualbox snapshot

# backing up a vm  
```
cd VirtualBox\ VMs/  
base=.  
src=win10-2018  
ls -lh $src  
du -sh $src  
df -h .  
tar -cpC $base $src -P | pv -s $(du -sb $base/$src | awk '{print $1}') | lz4 >> $src.tar.lz4  
# 8.79GiB 0:00:43 [ 205MiB/s] [=====================================================================> ] 99%  
```

[Gist for backing up with lz4](https://gist.github.com/timabell/68d112d66623d9a4a3643c86a93debee#file-backup-sh-L21)

## Updates! Updates! Updates!

(as Ballmer once said?)

*   poke **windows updates** until it finally decides there's no more
*   reboot
*   poke windows updates until it finally decides there's no more
*   reboot
*   poke windows updates until it finally decides there's no more
*   reboot
*   Install **virtualbox guest additions 5.1.34**
*   reboot
*   shutdown
*   backup again

<div class="flickr-pic">
<a href="https://www.flickr.com/photos/tim_abell/38944561440/"
target="_blank"><img
src="https://live.staticflickr.com/4798/38944561440_829d76ac80.jpg"
style="max-height: 375px" alt="Photo of a lit pool at night"></a>
</div>

## The Snapshot Trials

[VirtualBox has a neat snapshot feature](https://www.howtogeek.com/150258/how-to-save-time-by-using-snapshots-in-virtualbox/), so you can try out a whole tree of attempts at installs then squash them into the final image or roll them back.

Take a snapshot as a starting point for trying out the eternally broken boxstarter script.

## Boxstarter

[Boxstarter script, mostly working in win 10](https://gist.github.com/timabell/608fb680bfc920f372ac) now, but so much more to do on top that, including [windows branch of dotfiles](https://github.com/timabell/dotmatrix/tree/windows) (always needs work). Read the script to see what it configures and installs.

You'll want to watch this vid at at least 2x playback speed:

<https://youtu.be/Hiz9_i67B3o>

## annoyances / setup - grab reg keys

*   disable screensaver
*   hide task manager when minimized
    *   `HKCU\Software\Microsoft\Windows\CurrentVersion\TaskManager\Preferences` - binary. sigh.settings > m
*   multitasking > snap (these have been rolled in to my boxstarter, but not tested there).
    *   `HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\SnapAssist` - 0  
        `HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\JointResize` - 0
*   all sounds off - generates 100s of reg keys, one for each event
*   mute

## get ready for dev

*   vs sign-in
*   extension updates
    *   ssdt - external download popup, installs sql server 2016 localdb, takes forever, requires reboot
    *   azure - leave for now, also external
*   jetbrains toolbox (sign in)
    *   resharper
    *   datagrip

## VS Extensions

`cinst editorconfig.vs vsvim ihateregions -y` - bit-rotten, didn't work - I should contact the [VsVim package maintainer](https://chocolatey.org/packages/vsvim). Oh never mind that would be me then.

Extensions to install manually:

*   <https://marketplace.visualstudio.com/items?itemName=JaredParMSFT.VsVim>
*   <https://marketplace.visualstudio.com/items?itemName=ZoltanKlinger.RelativeLineNumbers>
*   <https://marketplace.visualstudio.com/items?itemName=MadsKristensen.MarkdownEditor>
*   <https://marketplace.visualstudio.com/items?itemName=VisualStudioProductTeam.VisualStudio2015ColorThemeEditor> - to get solarized colours

Something to look in to <https://chocolatey.org/packages/batch-install-vsix>

## Git setup

GitExtensions defaults to the program files putty, but the chocolatey one is newer and github deprecated the comms the old one uses.

*   <https://github.com/desktop/desktop/issues/4105>
*   <https://blog.github.com/2018-02-23-weak-cryptographic-standards-removed/>

Change all the putty paths in git extensions to start with `C:\ProgramData\chocolatey\bin\...`

![Workspace 1_193]({{ site.baseurl }}/assets/workspace-1_193.png)

<https://git-extensions-documentation.readthedocs.io/en/latest/settings.html>

> Settings that are specific to Git Extensions and apply globally will be stored in a file called `GitExtensions.settings` either in the user’s application data path or with the program. The location is dependant on the IsPortable setting in the `GitExtensions.exe.config` file that is with the program.

i.e .`C:\Users\tim\AppData\Roaming\GitExtensions\GitExtensions`

### Key Setup

*   Map a read-write folder to outside the VM to keep the putty keys in (this avoids regenerating the key if the VM is regenerated / rolled back, and also means keys aren't copied around with the VM image which makes them a bit easier to keep track of
*   git extensions > tools > putty > generate
*   set passphrase
*   save pub & private keys to shared folder
*   grab the public key from the generator, paste into github & bitbucket website account ssh configs
*   git extensions > tools > putty > start agent > add keys

### DotMatrix

Start git bash from git extensions, not the start menu (to get ssh set up right).

```
cd /c/repo && mkdir tim && cd tim  
git clone git@github.com:timabell/dotmatrix.git  
cd dotmatrix/  
git checkout windows  
bin/install  
git st  
```

## VS Settings

![Workspace 1_194]({{ site.baseurl }}/assets/workspace-1_194.png)

VS > Options > Environment > Import/export > set the path to the dotmatrix copy

## resharper settings

![Workspace 1_195]({{ site.baseurl }}/assets/workspace-1_195.png)

VS > Resharper > manage options > right-click the gap > add layer > open settings file > select the one from the dotmatrix

## More settings

*   VsVim settings
*   git config
*   email/name

## More installs

redgate tools

*   dev bundle:
    *   sql prompt - for VS too
    *   compare
    *   data compare
    *   doc
*   toolbelt bundle
    *   readyroll

## firefox

*   sign-in
*   ghostery settings - disable annoying purple dot
