---
layout: post
title: Multi-room music at home
date: '2007-03-16T17:09:00.000Z'
author: Tim Abell
tags: 
modified_time: '2007-03-16T17:45:55.271Z'
blogger_id: tag:blogger.com,1999:blog-5082828566240519947.post-40259322387808297
blogger_orig_url: https://timwise.blogspot.com/2007/03/multi-room-music-at-home.html
---

me and [slimserver](http://freshmeat.net/projects/slimserver/)  

Today, I wanted to play music/radio in more than one room, and since BBC Radio 4 was playing The Archers, that ruled out the FM/Radio 4 simple option!  

So, not liking to do anything the simple way, I set about searching for a way to broadcast sound to multiple rooms, preferably with a UDP/multicast type setup. Didn't manage that in the end, but have got something quite cool running.  

Initially came across [firefly](http://www.fireflymediaserver.org/) media server, from [an article](http://www.linux-magazine.com/issue/77/Firefly_Audio_Streaming.pdf) [pdf] in [linux magazine](http://www.linux-magazine.com/). Was put off by its absence from the ubuntu repositories.  

I have a mate with a [slimdevice](http://www.slimdevices.com/), which is an awesome device. The server side of it is available free as it is OSS, and it is in the ubuntu repo (universe). So install was trivial:  

    sudo apt-get install slimserver  

I could immediately connect with a web browser to http://localhost:9000/ and see the web interface (which is very good), and point any of my media players to http://localhost:9000/stream.mp3 and listen to the selected music. Nice. (Requires mp3 codec support to be installed. See [easyubuntu](http://easyubuntu.freecontrib.org/))  

Two things tripped me up connecting remotely. I had already spotted "Server Settings / Security / Allowed IP Addresses" and added my local subnet, but wasn't able to connect from another pc.  
netstat showed that the server had only bound to the local ip address:  

    $ netstat -tln  
    Active Internet connections (only servers)  
    Proto Recv-Q Send-Q Local Address Foreign Address State  
    ...  
    tcp 0 0 127.0.0.1:9000 0.0.0.0:* LISTEN  
    ...  

Through chance I knew about defaults files in ubuntu. Looking in /etc/defaults/slimserver, what do I find? Only bind to localhost. duh!  

    ...  
    # This limits http access to the local host.  
    # Comment it out for network-wide access, or change  
    # to enable a single interface.  
    HTTP_ADDR=127.0.0.1  
    ...

So, I commented out the http_addr line, and restarted the slimserver.  

    sudo /etc/init.d/slimserver restart  

Slim server was now listening on *:9000  

The other thing that tripped me up is that slimserver doesn't multicast, it maintains an independent stream & playlist for each connected device. So when I connected remotely I hadn't added music to the right playlist. In the web based interface there is a drop down list to select which device's playlist you want to modify. Once I figured that out it all worked. Yay. :-)  

Didn't solve the original problem of playing the same audio simultaneously in multiple rooms, but it's cool nonetheless.
