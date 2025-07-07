---
layout: post
title: Subversion to git - the pain retold
date: '2012-12-05T00:33:00.000Z'
author: Tim Abell
tags:
modified_time: '2012-12-05T00:33:51.154Z'
blogger_id: tag:blogger.com,1999:blog-5082828566240519947.post-8381628268559719103
blogger_orig_url: https://timwise.blogspot.com/2012/12/subversion-to-git-pain-retold.html
---

I've spent a week reminding myself why svn sucks.

I've been using the [freetts](http://freetts.sourceforge.net/) library for
speech synth in the [communication
book](http://communication-book.wikispaces.com/) program I've been working on,
and have tripped over a bug in freetts running under openJdk. The freetts
source code lives in a svn repository on sourceforge. The first step in
troubleshooting is to build the library from source. In order to track any
local experimentation / fixes I need to have some kind of local source control,
and svn sucks too much to provide this. The obvious next step is to pull the
sources down with git-svn (or svn2git as github recommends).

After a couple of aborted attempts I was reminded how the loosely defined
structure of a svn repository and the over-generalization of tags & branches
allows for a complete mess, which then is a pain to import cleanly.

> "And they want to make snapshots of smaller subdirectories of the filesystem.
> After all, it's not so easy to remember that release 1.0 of a piece of
> software is a particular subdirectory of revision 4822."
>
> ~ [http://svnbook.red-bean.com/en/1.7/svn.branchmerge.tags.html](http://svnbook.red-bean.com/en/1.7/svn.branchmerge.tags.html)

**Argh!** Terrible "feature", if you're using this feature then _you're doing
source control wrong_!

I could just grab a tarball and start from there, however there is new code
upstream since their last release (v1.2.2), and that means testing two
branches, and possibly investigating diffs. In addition if I'm going to make
the effort to import the history, I ought to do it well enough first time that
others can build on it. It's much harder to correct a bad scm import once work
is continued, especially in the distributed world of open source.

And so, for my sins, I set about importing the history, and hacking away at it
with the excellent tools git provides to turn it into something that actually
linked together correctly and didn't make me feel ill by including CVSROOT all
over the place (yes, it's not the first migration this project's been through).

On the plus side, it is fantastic that the open source license gives a user of
a library such as myself the right to go ahead and do something like this and
to share the improvement with the world, regardless of whether it's something
the original creators / maintainers would have done.

<div class="flickr-pic">
<a href="https://www.flickr.com/photos/tim_abell/8160450028/"><img
src="https://live.staticflickr.com/7271/8160450028_af1097a2f7.jpg"
alt="Photo of lake, trees and ducks at sunset"></a>
</div>

The layout of the FreeTTS svn repo is not consistent in directory structure,
which means the svn import tools don't behave quite as one might expect. This
is the inevitable downside to subversions poor choice of architecture around
"everything's just a directory structure". (Bitter? Me? Never!)

Here's a taster of how inconsistent the layout is and what a challenge is ahead
tidying it up:

```
tim@atom:~/repo/freetts.svn$ ls */*
branches/release:
FreeTTS

tags/freetts:
FreeTTS

tags/pre-rel1-1:
FreeTTS

tags/rel_1_0_5:
CVSROOT FreeTTS

tags/rel1_1_0:
FreeTTS

tags/rel1_1_2:
FreeTTS

tags/rel1_2_0:
CVSROOT FreeTTS

tags/rel1_2_1:
FreeTTS

tags/rel1_2_2:
acknowledgments.txt build.xml demo.xml index.html license.terms overview.html RELEASE_NOTES speech.properties tests
ANNOUNCE.txt demo docs lib mbrola README.txt rtp src tools

tags/rel_1_2_beta:
FreeTTS

tags/rel1_2beta2:
CVSROOT FreeTTS

tags/start:
FreeTTS

tags/sun:
FreeTTS

trunk/CVSROOT:
checkoutlist commitinfo config cvsignore cvswrappers editinfo loginfo modules notify rcsinfo syncmail taginfo verifymsg

trunk/FreeTTS:
acknowledgments.txt build.xml demo.xml index.html license.terms overview.html RELEASE_NOTES speech.properties tools
ANNOUNCE.txt demo docs lib mbrola README.txt rtp src unittests</span>
```

It took all my git-fu powers to sort out this mess. Below is a time shortened
sequence of how it was done, just in case I have the misfortune to need to do
it again. I ended up abandoning all the ancient tags as they were going to be
more effort than I liked to fix, and they could be added retrospectively if
anyone really cared. It took me many attempts to get to the below, and this is
what I've reconstructed from my fragmented history, hopefully it will provide
enough clues should you wish to do similar.

FreeTTS project urls:

* Project front page [http://freetts.sourceforge.net/](http://freetts.sourceforge.net/)
* project site [http://sourceforge.net/projects/freetts/](http://sourceforge.net/projects/freetts/)
* repo browser [http://freetts.svn.sourceforge.net/viewvc/freetts/](http://freetts.svn.sourceforge.net/viewvc/freetts/)
* svn http access [https://freetts.svn.sourceforge.net/svnroot/freetts/](https://freetts.svn.sourceforge.net/svnroot/freetts/)

At time of writing the current svn revision is 582.

The latest packaged version for ubuntu:

```
**apt-cache show freetts**Package: freetts
Priority: optional
Section: universe/java
Installed-Size: 13532
Maintainer: Ubuntu Developers <[ubuntu-devel-discuss@lists.ubuntu.com>](http://www.blogger.com/ubuntu-devel-discuss@lists.ubuntu.com%3E)Original-Maintainer: Bdale Garbee <[bdale@gag.com>](http://www.blogger.com/bdale@gag.com%3E)Architecture: all
**Version: 1.2.2-3**Depends: default-jre | java2-runtime
Filename: pool/universe/f/freetts/freetts_1.2.2-3_all.deb
Size: 9456904
MD5sum: 183bed09b1b8e2d8642f46b7538273f4
SHA1: 8df47df82124704b890f446a1bc958d33fd273d3
SHA256: 8920440eaa58c087cb268e8e2a64d44ac873fb44d49b34f180f587f9c69421a7
Description-en: speech synthesis system
FreeTTS is a speech synthesis system written entirely in the Java(TM)
programming language. It is based upon Flite, a small run-time speech
synthesis engine developed at Carnegie Mellon University. Flite in turn
is derived from the Festival Speech Synthesis System from the University
of Edinburgh and the FestVox project from Carnegie Mellon University.
Homepage: [http://freetts.sourceforge.net](http://freetts.sourceforge.net/)Description-md5: a346fe6dcc2c0164ec6b7c3891945e56
Bugs: [https://bugs.launchpad.net/ubuntu/+filebug](https://bugs.launchpad.net/ubuntu/+filebug)Origin: Ubuntu
```

So here's the import more or less as it happened:

```
mkdir freetts.svn.git; cd freetts.svn.git
svn2git --verbose (https://freetts.svn.sourceforge.net/svnroot/freetts/
git gc
```

```
cat .git/config

 [core]
  repositoryformatversion = 0
  filemode = true
  bare = false
  logallrefupdates = true
 [svn-remote "svn"]
  noMetadata = 1
  url = [https://freetts.svn.sourceforge.net/svnroot/freetts](https://freetts.svn.sourceforge.net/svnroot/freetts) fetch = trunk:refs/remotes/svn/trunk
  branches = branches/*:refs/remotes/svn/*
  tags = tags/*:refs/remotes/svn/tags/*
 [branch "release"]
  remote = .
  merge = refs/remotes/svn/release
```

get a copy without the svn references (which stop us seeing whether the rewritten history is free of old cruft)

```
cd ..
git clone freetts.svn.git/ freetts.git
cd freetts.git/
gitk --all &
**# The following is done while keeping an eye on and refreshing (ctrl+f5) gitk to see the effects:**
# Filter out the cvs rubbish so that git can match up commits that do have it with commits that don't
git filter-branch --tree-filter 'rm -rf CVSROOT' --prune-empty -- --all
# Remove the unnecessary top level folder (which inconsistently existed)
git filter-branch --prune-empty --subdirectory-filter FreeTTS/ -- --all
# Remove the backup refs filter-branch creates
rm -rf .git/refs/original/
```

delete all the crappy svn "tags", just tag the latest

```
git tag -d `git tag`

Deleted tag 'freetts' (was 8d953b7)
Deleted tag 'pre-rel1-1' (was d1c597f)
Deleted tag 'rel1_1_0' (was 625abdd)
Deleted tag 'rel1_1_2' (was b51fb71)
Deleted tag 'rel1_2_0' (was 7a4fc18)
Deleted tag 'rel1_2_1' (was a126a4a)
Deleted tag 'rel1_2_2' (was b3a0dcf)
Deleted tag 'rel1_2_2@557' (was bf94dbe)
Deleted tag 'rel1_2beta2' (was c0d90e9)
Deleted tag 'rel_1_0_5' (was e95aff8)
Deleted tag 'rel_1_2_beta' (was 1723b2d)
Deleted tag 'start' (was c020efe)
Deleted tag 'sun' (was cfadbc8)
```

correct commit found manually:

```
git tag v1.2.2 ae49425
```

and finally, push to github

```
git remote add origin .... (my repo details)
git push --mirror
```

You can find my repo at [https://github.com/timabell/FreeTTS](https://github.com/timabell/FreeTTS)
and the intermediate copy here: [https://github.com/timabell/FreeTTS-svn-mirror](https://github.com/timabell/FreeTTS-svn-mirror)

_All done_

`^_^`

Here's the reason I didn't bother with tags in the end: I couldn't rewrite the
tags as they had no author:


```
git filter-branch --tree-filter 'rm -rf CVSROOT' --prune-empty --tag-name-filter cat -- --tags
Cannot create a new backup.
A previous backup already exists in refs/original/
Force overwriting the backup with -f
tim@atom:~/repo/freetts.git$ rm -rf .git/refs/original/
tim@atom:~/repo/freetts.git$ git filter-branch --tree-filter 'rm -rf CVSROOT' --prune-empty --tag-name-filter cat -- --tags
Rewrite 8611e271692fc33e6160a2a217b9b3060dfbcd1d (1044/1044)
Ref 'refs/tags/freetts' was rewritten
WARNING: Ref 'refs/tags/pre-rel1-1' is unchanged
WARNING: Ref 'refs/tags/rel1_1_0' is unchanged
Ref 'refs/tags/rel1_1_2' was rewritten
Ref 'refs/tags/rel1_2_0' was rewritten
Ref 'refs/tags/rel1_2_1' was rewritten
Ref 'refs/tags/rel1_2_2' was rewritten
Ref 'refs/tags/rel1_2_2@557' was rewritten
Ref 'refs/tags/rel1_2beta2' was rewritten
Ref 'refs/tags/rel_1_0_5' was rewritten
Ref 'refs/tags/rel_1_2_beta' was rewritten
Ref 'refs/tags/start' was rewritten
Ref 'refs/tags/sun' was rewritten
freetts -> freetts (b3a4bbf8768ade6275c91ce0e76d933e30b3ddbf -> 48e84e3560e765db3b33479e2e9a76fe2ccf3550)
**error: char79: malformed tagger field
fatal: invalid tag signature file
Could not create new tag object for freetts**
git show rel_1_2_beta | head
tag rel_1_2_beta
**Tagger: (no author) <(no author)@4963320b-1a4a-0410-81c8-f0a525965860>**Date: Mon Dec 22 14:46:05 2003 +0000

This commit was manufactured by cvs2svn to create tag '\''rel_1_2_beta'\''.

commit 57ed00e981585aad590c9521d7c3a0bccf6284fa
Author: (no author) <(no author)@4963320b-1a4a-0410-81c8-f0a525965860>
Date: Mon Dec 22 14:46:05 2003 +0000
```

------

My advice if you are importing svn for a commercial project: Don't! Just export, and import into your new source control tool. Leave the svn repo read only for a while just in case you need that history, and after a year of never looking back, archive it off.
