---
title: "good for nothing script kiddies"
date: 2004-02-26
slashdot_url: https://slashdot.org/journal/63429/good-for-nothing-script-kiddies
---

<p>Just been looking at the web logs for my cubs website (twyfordcubs.org.uk). Some one tried to get into the admin section, they found it though google, interesting.</p>
<p>The log entry:<br>2004-02-13 06:27:21 202.152.11.98 GET<nobr> </nobr>/cubs/admin.asp 200 2587 484 266 Mozilla/4.0+(compatible;+MSIE+6.0;+Windows+NT+5.0)+Opera+7.11++[en] http://www.google.com/search?q=allinurl:.co.uk+admin.asp&amp;hl=en&amp;lr=&amp;ie=UTF-8&amp;oe=utf-8&amp;start=80&amp;sa=N</p>
<p>then, sure enough, entry in my log-on log:<br>login: ' or 1=1--<br>13/02/2004 06:27:29     202.152.11.98     Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0) Opera 7.11 [en]<br>Logged in: False</p>
<p>Pathetic attempt, but I'll bet they get in somewhere. My company's site for example - guess I'd better check up on that.<br>At least they're using a decent browser.</p>
<p>backtrace:<br>Tracing route to sisfo2.idola.net.id [202.152.11.98]<br>over a maximum of 30 hops:</p>
<p>
    1    1 ms    1 ms    1 ms  my.router [192.168.1.1]<br>
    2    16 ms    16 ms    14 ms  81-86-71-1.dsl.pipex.com [81.86.72.1]<br>
    3    16 ms    16 ms    16 ms  62-241-161-41.dsl.pipex.com [62.241.161.41]<br>
    4    18 ms    16 ms    16 ms  POS4-0.GW2.LND9.ALTER.NET [146.188.56.97]<br>
    5    15 ms    16 ms    17 ms  so-4-0-0.xr1.lnd9.alter.net [158.43.150.157]<br>
    6    16 ms    15 ms    16 ms  so-0-1-0.TR1.LND9.ALTER.NET [146.188.15.33]<br>
    7    94 ms    93 ms    94 ms  so-7-0-0.IR1.NYC12.ALTER.NET [146.188.8.197]<br>
    8    94 ms    94 ms    95 ms  0.so-1-0-0.IL1.NYC9.ALTER.NET [152.63.23.61]<br>
    9   158 ms   160 ms   157 ms  0.so-1-1-0.TL1.SAC1.ALTER.NET [152.63.10.78]<br>
  10   158 ms   157 ms   157 ms  0.so-7-0-0.XL1.SAC1.ALTER.NET [152.63.53.249]<br>
  11   158 ms   158 ms   157 ms  0.so-3-0-0.XR1.SAC1.ALTER.NET [152.63.53.238]<br>
  12   157 ms   158 ms   158 ms  POS6-0.IG2.SAC1.ALTER.NET [152.63.54.113]<br>
  13     *        *        *     Request timed out.<br>
  14     *        *        *     Request timed out.</p>
<p>PS: I wonder if password hashing is a bit extreme for a cubs website.</p>

