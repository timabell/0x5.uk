---
layout: post
title: getting supybot to announce new bugzilla bugs
date: '2009-11-16T17:22:00.005Z'
author: Tim Abell
tags:
- irc
- howto
- ubuntu
- linux
- bugzilla
- script
- oss
- sys admin
modified_time: '2009-11-17T10:23:25.092Z'
blogger_id: tag:blogger.com,1999:blog-5082828566240519947.post-8826812947380288670
blogger_orig_url: https://timwise.blogspot.com/2009/11/getting-supybot-to-announce-new.html
---

getting supybot to announce new bugzilla bugs - I've just put here the key non-obvious things that tripped me up when trying to set this up.

All done on Ubuntu 8.04.3 LTS

Install [supybot](http://sourceforge.net/projects/supybot/) and the [supybot bugzilla plugin](http://code.google.com/p/supybot-bugzilla/).

Create a system group (supybot) and user (bugbot) to run supybot as.

Set up your supybot configuration file as desired.

Getting supybot to start at startup:
[http://www.schwer.us/journal/2005/04/17/supybot-init-script-for-debian/](http://www.schwer.us/journal/2005/04/17/supybot-init-script-for-debian/)

Here's my modified init script

```
$ cat /etc/init.d/bugbot
#! /bin/sh
#
# supybot init script
# http://www.schwer.us/journal/2005/04/17/supybot-init-script-for-debian/
#

PATH=/sbin:/bin:/usr/sbin:/usr/bin
DAEMON=/usr/bin/supybot
NAME=supybot
DESC=supybot

test -f $DAEMON || exit 0

set -e

case "$1" in
start)
echo -n "Starting $DESC: "
start-stop-daemon --start --quiet \
--chuid bugbot --exec $DAEMON -- --daemon /etc/supybot/bugbot.conf
echo "$NAME."
;;
stop)
echo -n "Stopping $DESC: "
start-stop-daemon --stop --quiet \
--oknodo --exec /usr/bin/python
echo "$NAME."
;;
restart)
$0 stop
$0 start
;;
*)
echo "Usage: $0 {start|stop|restart}" >&2
exit 1
;;
esac

exit 0
```

Set up bugzilla to send a copy of all bugmail to a local address (eg bugbot@localhost), and configure exim4 to accept local mail (as well as smart host delivery), using the mbox format.

    sudo dpkg-reconfigure exim4-config

Start a conversation with bugbot, get it to identify you, then set the required configuration by sending it messages (you can also set these in the supybot .conf file for your bot):

    config plugins.Bugzilla.mbox /var/mail/bugbot

and

    config plugins.Bugzilla.bugzillas.your-bugzilla-name.watchedItems.all True

which will turn on the announcements (i had to read the code to find that one!)

Note that supybot doesn't immediately write config changes to disc.
