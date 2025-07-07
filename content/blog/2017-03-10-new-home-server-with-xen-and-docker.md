---
layout: post
title: New home server with Xen and docker
date: 2017-03-10 00:03:48.000000000 +00:00
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
permalink: "/2017/03/10/new-home-server-with-xen-and-docker/"
---
## No cloud mkay?

Going against the current received wisdom I personally am not keen to trade the convenience of the public cloud sync services such as dropbox, onedrive, google drive etc for the fact that this means that all my files traverse the public internet and live on someone else's metal. Sure it might be encrypted, but what if my traffic is intercepted and stored, and then that encryption is later found to be flawed?

I'm probably just as likely to get pwned running my own setup, but hey at least I get to learn something along the way.

Another thought is that regardless of location - home, office, cloud, vps host or data centre - it's all just (server) software. So why shouldn't we be able to get the amazing seamless experience when self hosting? It seems to me that it comes down to economics. Cloud hosting gives an opportunity for charging directly or worse using underhand tactics like owning your data or selling you as a product to advertisers. This means there is more funding for cloud systems, and therefore more developers are working on it. Even ethically minded software developers have to eat and live somewhere. I think just like Linux vs Windows we will get a perfectly good open source solution, but it will likely lag behind.

## Disk encryption

I have a new machine to use as a server so have an opportunity for a fresh approach. I want my server encrypted at rest in case the whole machine gets stolen from the house to keep the scoundrels from having easy access to all my files.

The previous machine I installed with encrypted LVM as available with Ubuntu server's installer; but this means going to the machine to unlock it after every reboot / power failure / kernel upgrade. I did have [remote unlock via dropbear ssh](http://blog.nguyenvq.com/blog/2011/09/13/remote-unlocking-luks-encrypted-lvm-using-dropbear-ssh-in-ubuntu/) set up but it's hacky to set up and non-trivial to use.

This time I've gone for a different approach:

*   An unencrypted install of ubuntu server (DomU) with an ssh server, so no password required to boot up, which does nothing more than give access to:
*   A Xen VM install of Ubuntu server (Dom1), this one with LVM disk encryption. This is where all my files etc will live. Installed with [virt-manager](https://virt-manager.org/), which is a very convenient UI for initial setup.

So now after a reboot I can `ssh -X` into the DomU server, then using virt-manager I can see the Dom1 VM waiting for the disk encryption key and provide the passphrase.

## Xen

[Setup instructions for xen on Ubuntu](https://help.ubuntu.com/community/Xen#Installing_Xen).

It wasn't immediately obvious how to set up the networking. This was the network config that worked in the end (after ifdown/ifup, also tested with full reboot):

```
$ cat /etc/network/interfaces
source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback

auto xenbr0
iface xenbr0 inet dhcp
  bridge_ports enp1s0

# The primary network interface
auto enp1s0
iface enp1s0 inet manual
#iface enp1s0 inet dhcp
```

## Docker

Seeing as docker is well and truly coming to windows it's time I got better at this so, for this and also better isolation and security I'll try and set up as many of the services I want to run as I can through docker.

First test case was [transmission-bt](https://transmissionbt.com/) which I run to be a good citizen and help seed [Linux Mint ISOs](https://www.linuxmint.com/download.php) using my [A&A unmetered upload](https://aa.net.uk/broadband-home1.html).

[Searching for transmission on docker hub](https://hub.docker.com/search/?isAutomated=0&isOfficial=0&page=1&pullCount=1&q=transmission&starCount=0), I didn't want the vpn one, I'm not pirating movies and my ISP doesn't do stupid filtering/shaping tricks on torrents. I chose the next most popular: [https://hub.docker.com/r/linuxserver/transmission/](https://hub.docker.com/r/linuxserver/transmission/)

To install and run it:

```
$ sudo -i
# useradd -r -s /sbin/nologin transmission
# id transmission
id=999(transmission) gid=999(transmission) groups=999(transmission)
# cd /var
# mkdir transmission
# cd transmission
# mkdir config downloads watch
# chown transmission:transmission .
# docker create --name=transmission \
  -v /var/transmission/config/:/config \
  -v /var/transmission/downloads/:/downloads \
  -v /var/transmission/watch/:/watch \
  -e PGID=999 -e PUID=999 -e TZ="Europe/London" \
  -p 9091:9091 -p 51413:51413 -p 51413:51413/udp \
  linuxserver/transmission
# docker start transmission
# docker logs -f transmission
```

useradd ref: [http://askubuntu.com/questions/29359/how-to-add-user-without-home](http://askubuntu.com/questions/29359/how-to-add-user-without-home)

Once that was done I could see the transmission web UI at `http://dom1vm:9091/`. Hurrah.

## syncthing

[https://store.docker.com/community/images/linuxserver/syncthing](https://store.docker.com/community/images/linuxserver/syncthing)

Same deal with folders and users, then:

`# docker create --name=syncthing -v /var/syncthing/config/:/config -v /var/syncthing/data/:/data -e PGID=998 -e PUID=998 -p 8384:8384 -p 22000:22000 -p 21027:21027/udp linuxserver/syncthing`

## Start on boot

```
docker update --restart=unless-stopped transmission
docker update --restart=unless-stopped syncthing
```

[http://stackoverflow.com/a/37479753/10245](http://stackoverflow.com/a/37479753/10245)

## Todo

*   [nextcloud](https://nextcloud.com/) - has an iOS app that syncthing doesn't yet, might also have better selective sync
    *   <https://store.docker.com/community/images/wonderfall/nextcloud>
*   plex server
    *   <https://www.plex.tv/>

## Further reading

*   <https://forum.level1techs.com/t/dexter-kanes-ultra-paranoid-encrypted-nas-completed/98340>
