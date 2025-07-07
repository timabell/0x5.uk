---
layout: post
title: Running sdv in docker
date: 2017-08-13 20:35:14.000000000 +01:00
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
permalink: "/2017/08/13/running-sdv-in-docker/"
---
Just bought a shared server with [bytemark](https://www.bytemark.co.uk/). (£10/month), Installed vanilla ubuntu 16.04LTS server using the control panel (virtually one-click).

![Servers - Bytemark Manager - Mozilla Firefox_143]({{ site.baseurl }}/assets/servers-bytemark-manager-mozilla-firefox_143.png)

(Love the cancel button text!)

Ssh'd in, created my own user to use with sudo instead of root. Ran the following, and immediately had a copy of sdv listening on the internet.

```
sudo apt install tmux docker docker-compose
sudo adduser tim docker
# logout & reconnect to get new group to take effect
wget https://raw.githubusercontent.com/timabell/sdv-docker/master/docker-compose.yml
```

and then for the magic:

```
tim@sdvweb:~$ docker-compose up
Pulling sdv (timabell/sdv:latest)...
latest: Pulling from timabell/sdv
d5c6f90da05d: Pull complete
1300883d87d5: Pull complete
c220aa3cfc1b: Pull complete
2e9398f099dc: Pull complete
dc27a084064f: Pull complete
eb1a4736b68c: Pull complete
0706cf350247: Pull complete
1d0ac78e96a5: Pull complete
Digest: sha256:9003a79f019b3ee16e7c6324afd275b4535f867602e63db317e430528e2a6771
Status: Downloaded newer image for timabell/sdv:latest
Creating tim_sdv_1
Attaching to tim_sdv_1
sdv_1 | ./sdv-linux-x64 -listenOn 0.0.0.0 -port 8080 -driver sqlite -db /data/Chinook_Sqlite_AutoIncrementPKs.sqlite
sdv_1 | 2017/08/13 19:14:44 Sql Data Viewer v0.4; Copyright 2015-2017 Tim Abell <sdv@timwise.co.uk>
sdv_1 | 2017/08/13 19:14:44 ## This pre-release software will expire on: 2017-10-01 00:00:00 +0000 UTC, contact sdv@timwise.co.uk for a license. ##
sdv_1 | 2017/08/13 19:14:44 Starting server on http://0.0.0.0:8080/ - Press Ctrl-C to kill server.
```

And that's it, listening on the internet!

![Sql Data Viewer - Mozilla Firefox_144]({{ site.baseurl }}/assets/sql-data-viewer-mozilla-firefox_144.png)

Any changes I make will be to the [docker and compose files](https://hub.docker.com/r/timabell/sdv/), resulting in trivially easy to repeat deployments, making the server completely throwaway. Huzzah! Docker is awesome.

I've also bought a domain for the product, but haven't set much up on it yet: <http://www.sqldataviewer.com/>

Next up, getting nginx reverse proxy to provide ssl. And finishing the refactor I was in the middle of to get data types to behave, and finishing the automated regression tests I'd just started (needed for reliable multi rdbms support), and finding my market, and marketing the product, and doing more features, and build the marketing automation to drive sales, etc etc. Not too much to do then! Your support would be appreciated, if you're interested make sure you [sign up to the mailing list now](https://www.getdrip.com/forms/70504364/submissions/new)!

If you're wondering why docker matters more generally then listen to this podcast episode: Hanselminutes: Practical Containers for Developers with Aja Hammerly <http://www.hanselminutes.com/default.aspx?ShowID=18514>
