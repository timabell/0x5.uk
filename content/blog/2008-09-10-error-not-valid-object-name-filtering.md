---
layout: post
title: error "Not a valid object name" filtering an ex-svn git repo with renames
date: '2008-09-10T14:18:00.007Z'
author: Tim Abell
tags:
- dev
- git
- troubleshooting
- svn
modified_time: '2008-09-11T09:27:31.215Z'
thumbnail: http://farm4.static.flickr.com/3085/2800643267_aa1dd46299_t.jpg
blogger_id: tag:blogger.com,1999:blog-5082828566240519947.post-2621355116425651592
blogger_orig_url: https://timwise.blogspot.com/2008/09/error-not-valid-object-name-filtering.html
---

Under git version 1.5.4.3, which as of writing is the current in ubuntu 8.04
hardy heron, trying to split out a folder from a git repo where the repo was an
import from subversion (svn), and the folder was renamed in the past causes a
failure as show below:

```
#!/bin/bash -v
rm -rf test-case
mkdir test-case
cd test-case/
svnadmin create svnrepo
export repo="`pwd`/svnrepo"
mkdir -p import/a
echo '1' >> import/a/file.txt
svn import -m 'initial import' import file://$repo/trunk/
svn co file://$repo/trunk/ checkout
echo '2' >> checkout/a/file.txt
svn ci -m "file modified" checkout
svn mv -m "moving file" file://$repo/trunk/a file://$repo/trunk/b
svn up checkout
echo '3' >> checkout/b/file.txt
svn ci -m "modified again" checkout
svn log -v checkout
mkdir -p gitcopy/a
git svn clone file://$repo/trunk/ gitcopy/a
cd gitcopy/a
git filter-branch --subdirectory-filter a   # <= FAILS
cd ../../
mkdir gitcopy/b
git svn clone file://$repo/trunk/ gitcopy/b
cd gitcopy/b
git filter-branch --subdirectory-filter b
```

The marked line above fails with the following error:

    [1] Rewrite bcfe73ef303832b6112a2419dc1da5f782672c14 (3/3)fatal:
    Not a valid object name bcfe73ef303832b6112a2419dc1da5f782672c14:a

This has been fixed in the latest build of git: `version 1.6.0.1.294.gda06a`
and no longer fails.

The "fatal: Not a git repository" error message that filter branch produces
doesn't seem to matter.

<div class="flickr-pic">
<a  href="https://www.flickr.com/photos/tim_abell/2800643267"><img
src="https://live.staticflickr.com/3085/2800643267_aa1dd46299.jpg" alt="Photo of a break dancer in barcelona"></a>
</div>

