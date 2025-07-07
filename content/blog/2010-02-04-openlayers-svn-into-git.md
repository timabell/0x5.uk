---
layout: post
title: openlayers svn into git
date: '2010-02-04T14:01:00.014Z'
author: Tim Abell
tags:
- git
- openlayers
- svn
modified_time: '2011-05-18T22:12:01.236Z'
blogger_id: tag:blogger.com,1999:blog-5082828566240519947.post-1272986229621647717
blogger_orig_url: https://timwise.blogspot.com/2010/02/openlayers-svn-into-git.html
---

Initial clone:

    git svn clone -T trunk/openlayers/ -t tags/openlayers/ -b branches/openlayers/ http://svn.openlayers.org/ openlayers.git

"http://svn.openlayers.org/tags/openlayers/docs-2.8/" is in the wrong place and gets pulled in by the git clone.

I should have used `--no-follow-parent` to avoid the _docs-2.8_ tag pulling in docs history but not going to re-clone now. If you are repeating this, try this instead:

    git svn clone --no-follow-parent -T trunk/openlayers/ -t tags/openlayers/ -b branches/openlayers/ http://svn.openlayers.org/ openlayers.git

Find the errant docs branches & eliminate:

    cd openlayers.gitfor x in `git for-each-ref --format="%(refname)" 'refs/remotes/tags/docs*'`; do git update-ref -d $x; done

[http://dound.com/2009/04/git-forever-remove-files-or-folders-from-history/](http://dound.com/2009/04/git-forever-remove-files-or-folders-from-history/)
expunge old objects (I think this works)

    git reflog expire --allgit gc --aggressive --prune

Then run: [http://www.shatow.net/fix-svn-refs.sh](http://www.shatow.net/fix-svn-refs.sh) to create real git tags.

If you just want the result you can download a copy complete with svn metadata from [http://www.timwise.co.uk/openlayers-dev/openlayers.git.tgz](http://www.timwise.co.uk/openlayers-dev/openlayers.git.tgz)

You will then be able to run

    git svn fetch

to get updates from the openlayers svn server.

There is a published copy at [http://github.com/timabell/openlayers](http://github.com/timabell/openlayers), though it doesn't have the svn metadata.

* * *

I also tackled the docs folder:

The docs directory has no matching branch or tag directories, so the following is sufficient:

    git svn clone -T trunk/doc http://svn.openlayers.org/ openlayers-doc.gitgit gc --aggressive --prune

You can download this from [http://www.timwise.co.uk/openlayers-dev/openlayers-doc.git.tgz](http://www.timwise.co.uk/openlayers-dev/openlayers-doc.git.tgz)

* * *

Anything else I come up with will end up at [http://www.timwise.co.uk/openlayers-dev/](http://www.timwise.co.uk/openlayers-dev/)
