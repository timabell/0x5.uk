---
layout: post
title: Enabling TCP/IP in SQL Express 2008 R2
date: '2012-05-22T11:10:00.001Z'
author: Tim Abell
tags:
- howto
- sql server
modified_time: '2012-05-22T11:10:17.222Z'
thumbnail: http://3.bp.blogspot.com/-bcotqeE-qFo/T7tzqnDyBfI/AAAAAAAAAFc/sjBLaus6uu4/s72-c/sql-express-tcp-ip.png
blogger_id: tag:blogger.com,1999:blog-5082828566240519947.post-7356884620087853089
blogger_orig_url: https://timwise.blogspot.com/2012/05/enabling-tcpip-in-sql-express-2008-r2.html
---

Programs > .. R2 > SQL Server Configuration Manager
Network config > Protocols > tcp/ip > enable & properties

![](/assets/sql-express-tcp-ip.png)

Clear the dynamic port under IPAll
Set the TCP Port to 1433 (which is the standard sql server port).

You can then connect to "localhost" (with no instance specified) in management studio.

refs:

*   [https://vgoes.wordpress.com/2007/06/05/jdbc-to-sql-server-express/](https://vgoes.wordpress.com/2007/06/05/jdbc-to-sql-server-express/)
