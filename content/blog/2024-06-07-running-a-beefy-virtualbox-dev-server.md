---
title: "Running a beefy virtualbox dev server"
layout: post
---

## Why

Sometimes I have to work on hairy old sprawling legacy code bases in ye-olde c#, which means, unfortunately, no shiny new dotnet-core with Rider on linux and all the speed gains that brings.

So having fallen over another codebase that takes unbearably long to build and work on when combined with the need to run visual studio in a windows virtualbox vm on top of my linux box I've shelled out for a desktop pc with a top-end cpu to use as a dev box for those trickier builds. But who wants to give up the joy of a portable laptop, so here I am with the challenge of connecting to virtualbox from another machine. Turns out there's a few non-obvious things and options that may or may not work for you, so here's what worked for me.

### GNU's Not Unix and neither is Windows

Aside - windows will never again have ownership of my computer, I relegated it to a VM for emergencies (i.e. clients paying money), where it can stay within those steely confines unable to bother me the rest of the time. But that's another blog post really.

## Basic setup

This is pretty simple:

1. Install [Linux Mint](https://www.linuxmint.com/) because home servers are a lot easier to deal with when they're actually just normal desktop operating systems that are switched on more.
	1. Enable full disk encryption during setup (advanced > lvm > encrypt) (this is a bit of a nuisance for remote management but important for security if the machine is stolen)
1. Turn on automatic updates
1. Install virtualbox and openssh-server
1. Copy the "Virtualbox VMs" folder across by opening `sftp://ur-server-here/` in nemo (the file browser) on the source machine. It's [not the quickest](https://unix.stackexchange.com/questions/48399/fast-way-to-copy-a-large-file-on-a-lan) but it did 200gb in 5 hours, and I have other things to do in my life so that's fine.
1. Fire it up on the desktop with the virtualbox gui just to check it's fine

## Remote access - linux

To get some remote control of the machine simple `ssh` and `ssh -X` are enough for cli actions and some gui actions respectively (`-X` tunnels x-windows over ssh, meaning you can launch graphical programs on the remote machine and they pop up on the local display. Magic.)

## Remote access windows vm

This proved to be less obvious.

There are three possible layers to remote in:

1. Remote access to the host machine UI
2. Remote access to the virtualbox process
3. Remote access to the windows vm

Only number 3, directly connecting to the guest windows vm with RDP worked for me.

### 1. Host connection

Remote desktop in linux is still a bit of a mess.

VNC is klunky old, and I don't even know if it's secure any more, it's also not available out of the box. I didn't even try.

There's some more or less proprietary ones like nx (nomachine?), [rustdesk](https://rustdesk.com/), go-to-my-pc etc, which I either haven't had any luck with previously or haven't tried / don't trust.

I tried running the virtualbox command gui over ssh, but it had two problems:

1. It was too laggy / slow updating the screen to be useable for intense visual studio coding work
2. Disconnecting killed the virtualbox process and terminated the vm without proper shutdown

I quickly gave up on this and tried #2...

### 2. Remote access to virtualbox

Tantalizingly [virtualbox has RDP support available](https://www.virtualbox.org/manual/ch07.html).... but the punchline is that it's not part of the open source project, and is a proprietary "extension" that requires agreement to [a personal/evaluation license that explicitly forbids commercial use](https://superuser.com/questions/146398/virtualbox-puel-interpretation/1315219#1315219), so that was out. Darn. If you're only doing personal things you could try this, but I'm not so can't.

### 3. Remote access to windows vm

This was the winner in the end but requires a few steps to get set up:

1. Change the virtualbox vm network settings to "bridged" instead of the default "NAT" so that the vm is available directly on the network.
1. Grab the generated ipv6 address for the machine (or give it a static ip4 lease)
1. In the windows guest:
	1. [Enable remote desktop](https://learn.microsoft.com/en-us/windows-server/remote/remote-desktop-services/clients/remote-desktop-allow-access)
	1. Give the user account a password if it doesn't already have one (you can't connect remotely with a passwordless user).
1. Start the vm with the virtualbox cli instead of the gui (avoids it being terminated when the shell session ends):
	1. `vboxmanage startvm WinDev2404Eval --type headless`
1. On the client laptop install the [remmina rdp client](https://remmina.org/) with `apt`
1. Connect to the vm in remmina with the ip6 address of the guest machine (*not* the host desktop)
1. Enter the windows user's username & password when prompted

## Remote management tips

Here's some more useful commands for managing the server machine remotely over ssh:

List virtual machines (useful for getting the name):

```sh
vboxmanage list vms
```

Start a virtual machines

```sh
vboxmanage startvm WinDev2404Eval --type headless
```

Shut down the host

```sh
sudo shutdown -h now
```

(see <https://explainshell.com/explain?cmd=shutdown+-h+now>)

Suspend the host:

```sh
systemctl suspend
```

(ref <https://askubuntu.com/questions/1792/how-can-i-suspend-hibernate-from-command-line/1795#1795>

## Was it worth it?

Build time of a gnarly project on laptop:

```
========== Rebuild completed at 02:44 and took 20:08.230 minutes ==========
```

And the same vm running the same full rebuild remoted into the new desktop:
```
========== Rebuild completed at 02:28 and took 04:15.142 minutes ==========
```

You can even copy paste text like this straight out of the RDP'd VM which will be immensely useful.

## The end

That's all for this one. An obscure technical thing, that was useful to me, and just tricky enough to be worth documenting for future-me and the rest of the interwebs in case anyone finds it useful. Hurrah for blogs and zero cost of replication.

Till next time. 👋
