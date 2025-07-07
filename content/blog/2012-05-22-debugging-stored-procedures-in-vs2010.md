---
layout: post
title: Debugging stored procedures in VS2010 / SQL Express
date: '2012-05-22T16:58:00.000Z'
author: Tim Abell
tags:
modified_time: '2014-10-16T17:40:31.093Z'
thumbnail: http://1.bp.blogspot.com/-v43Zoh8QMUc/T7vIRbLcQ1I/AAAAAAAAAFo/465qvN6CYFM/s72-c/debug-t-sql-attach.png
blogger_id: tag:blogger.com,1999:blog-5082828566240519947.post-2656726104783111677
blogger_orig_url: https://timwise.blogspot.com/2012/05/debugging-stored-procedures-in-vs2010.html
---

Debugging stored procs in a _local_ SQL Express install with Visual Studio
2010.

Enable TCP/IP - see [http://timwise.blogspot.co.uk/2012/05/enabling-tcpip-in-sql-express-2008-r2.html](http://timwise.blogspot.co.uk/2012/05/enabling-tcpip-in-sql-express-2008-r2.html)

In Visual Studio, Server Explorer, Connect to your server as localhost instead
of .\SQLEXPRESS so that you connect through TCP/IP and not shared memory (which
doesn't allow debugging for some reason)

Find the project in your solution which actually executes the stored procedure,
right-click > properties > debug > "Enable SQL Server debugging"

Run your project

You may need to hit "stop" and re-attached (debug > attach to process)
explicitly selecting "T-SQL code" in the "attach to" box (and optionally
managed as well). It *should* automatically select T-SQL but it seems to be hit
and miss.

Set a breakpoint in your stored procedure:

*   Server explorer,
*   the connection you added,
*   stored procs,
*   right-click the proc name > open
*   set a break point in the text of the stored proc
*   if it is not a solid red dot then something went wrong

Run the part of your program / website that will cause the proc to be called.

If the breakpoint isn't hit check the type's in the attach to process list
include T-SQL (doesn't seem to always work).

I only got the damn thing to work once. If it doesn't work you get no reason at
all which is just crap. The main problem I have is that the attach just quietly
drops T-SQL even if you explicitly request it. Shoddy coding from Microsoft in
my opinion.

The next best thing is to right-click the stored proc, click "step into" and
input the values manually. (Which also requires a tcp/ip connection to the
local sql express and is fussy).


Another message encountered a couple of days later without changing anything at
all when attaching to the already running web dev process: "[<span
id="goog_211408035"></span>User Could Not Execute Stored Procedure
sp_enable_sql_debug<span
id="goog_211408036"></span>](http://msdn.microsoft.com/en-us/library/ms241735(v=vs.100).aspx)"

# References

*   [http://stackoverflow.com/questions/4737175/the-breakpoint-will-not-currently-be-hit-error-when-trying-to-debug-a-tsql](http://stackoverflow.com/questions/4737175/the-breakpoint-will-not-currently-be-hit-error-when-trying-to-debug-a-tsql)
*   [http://social.msdn.microsoft.com/forums/en-US/vstsdb/thread/f5247d99-06f0-4ae3-9371-04c70f750647/](http://social.msdn.microsoft.com/forums/en-US/vstsdb/thread/f5247d99-06f0-4ae3-9371-04c70f750647/)
*   [http://support.microsoft.com/kb/316549/en-us](http://support.microsoft.com/kb/316549/en-us)
    (from comment below)

# Screenshots

![](/assets/debug-t-sql-attach.png)

![](/assets/debug-t-sql-connect.png)

![](/assets/debug-t-sql-project.png)

![](/assets/debug-t-sql-open.png)

![](/assets/debug-t-sql-step.png)


