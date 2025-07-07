---
layout: post
title: automatic mysql backups
date: '2012-06-14T15:10:00.000Z'
author: Tim Abell
categories: [howto, mysql, linux]
modified_time: '2012-06-14T15:12:25.991Z'
blogger_id: tag:blogger.com,1999:blog-5082828566240519947.post-7356368576752162435
blogger_orig_url: https://timwise.blogspot.com/2012/06/automatic-mysql-backups.html
---

On a debian server with mediawiki installed and running with a local mysql.

```
root@myserver:~# apt-get install automysqlbackup

root@myserver:~# crontab -e

# m  h  dom mon dow   command
  5  4  *   *   *     automysqlbackup

root@myserver:~# automysqlbackup
root@myserver:~# cd /var/lib/automysqlbackup/
root@myserver:/var/lib/automysqlbackup# find .
.
./weekly
./weekly/wikidb
./weekly/information_schema
./daily
./daily/wikidb
./daily/wikidb/wikidb_2012-06-14_16h03m.Thursday.sql.gz
./daily/information_schema
./daily/information_schema/information_schema_2012-06-14_16h03m.Thursday.sql.gz
./monthly
```

Result! No longer need to write a custom cron script each time.

<div class="flickr-pic">
<a href="https://www.flickr.com/photos/tim_abell/7255107648/"><img
src="https://live.staticflickr.com/7226/7255107648_929530d9e0.jpg" alt="Ducklings at henley-on-thames"></a>
</div>

Project homepage:
[http://sourceforge.net/projects/automysqlbackup/](http://sourceforge.net/projects/automysqlbackup/)
