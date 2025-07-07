---
title: "copying all (hidden) files in linux with cp"
date: 2005-09-29
slashdot_url: https://slashdot.org/journal/118511/copying-all-hidden-files-in-linux-with-cp
---

<p>One of my old pet hates in Windoze is the default explorer setting to hide system files, which means you don't get everything when copying stuff.</p>
<p>In linux, a hidden a file or directory is anything that starts with a dot.<br>So, I want to take a copy of my ~/ (home, like windoze profile), hidden files and all.</p>
<blockquote>
<div><p> <tt>cd<nobr> </nobr>/home/tim<br>cp -r<nobr> </nobr>./*<nobr> </nobr>/mnt/otherhdd/stuff/timshome/</tt></p></div> </blockquote>
<p>Look with ls -l, no hidden files. hrmm.</p>
<p>Only thing I could find was this:<br><a href="https://www.redhat.com/archives/fedora-list/2004-October/msg01760.html">https://www.redhat.com/archives/fedora-list/2004-October/msg01760.html</a> </p>
<blockquote>
<div><p> <tt>cp -r<nobr> </nobr>.??*<nobr> </nobr>/mnt/otherhdd/stuff/timshome/</tt></p></div> </blockquote>
<p>Seems a bit clunky to me.<br>Anyone know a better way? Like cp -rh or summat.</p>

