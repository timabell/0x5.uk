---
layout: post
title: sharing work between computers with a usb flash drive and git
date: '2008-05-29T23:36:00.007Z'
author: Tim Abell
tags:
- howto
- backup
- dev
- linux
- git
- oss
- svn
modified_time: '2008-06-04T17:18:17.112Z'
thumbnail: http://farm4.static.flickr.com/3180/2500350904_0b0c2a44f3_t.jpg
blogger_id: tag:blogger.com,1999:blog-5082828566240519947.post-4719348621403422584
blogger_orig_url: https://timwise.blogspot.com/2008/05/sharing-work-between-computers-with-usb.html
---

I couldn't find anything exactly matching this on the net when I was figuring
it out, so here's what I did.

This is working against a remote svn (subversion) server, but applies even
without one.

On the first computer, grab your git working copy from svn with git-svn clone
(or clone a git repo, or just start a new one).

    mkdir ~/project.git
    cd ~/project.git
    git-svn clone svn://project-server/trunk
    git repack #for good measure

Plugin your usb flash drive/stick/external harddrive, I'll presume it's a
vfat/fat32/fat16 formated device mounted at `/media/flash`.  Create an empty
repository on the drive, I'll use a bare one as there's no need to keep the
working copy as well.

    mkdir /media/flash/project.git
    git --bare init /media/flash/project.git

Then add the flash drive git repo as a remote source in your local git repo.
"flash" is the name I've given to the remote branch reference, you can call it
whatever you like.

    git remote add flash /media/flash/project.git

If you push immediately it will fail (as I discovered) because fat doesn't
support the execute flag on files, so all the hooks are automatically active.

<div class="flickr-pic">
<a href="https://www.flickr.com/photos/tim_abell/2500350904/"><img
src="https://live.staticflickr.com/3180/2500350904_0b0c2a44f3.jpg" alt="Photo of blue parrot"></a>
</div>

I deleted all the hooks as I wasn't planning on using them, this may be wrong
so no promises, but it seems ok so far for me. So remove the hooks with:

    rm /media/flash/project.git/hooks/*

Then push your current local copy to the flash drive with:

    git push flash

This will copy all your committed work onto the flash drive, even if you
haven't pushed it upstream to the svn server with `git-svn dcommit` yet. Bonus!
It won't copy any of your branches across though, so you if you want them you
can add those independently with:

    git push flash mybranch

Now move over to the second computer and plug the flash drive in. I'm making
the same assumptions on paths and devices. Do another completely independent
svn checkout as above:

    mkdir ~/project.git
    cd ~/project.git
    git-svn clone svn://project-server/trunk
    git repack #for good measure

Then add the flash drive's repo to the git repo on the second pc and pull all
changes from the flash drive, optionally including any branches:

    git remote add flash /media/flash/project.git
    git pull flash master
    git pull flash mybranch #if you like

When you've committed changes to git or pulled the latest changes from svn on
either pc, you can then update the flash drive with the simple command:

    git push flash

Which pushes all your changes on your master branch on to the flash drive. You
are now ready to run the pull command on the other computer to get back in
sync:

    git pull flash master

If you don't push changes to the flash drive before committing to svn then
things will be very simple. If you push changes to the flash drive, and then
commit them to the svn server you will need to do a little more work. This is
because when you run "git svn dcommit" it pushes your latest git commits to the
svn server, deletes your locally committed changes, and then fetches them back
from the svn server. This means that git won't recognise your local changes as
being the same as the ones on the flash drive because they have different
commit message and SHA1 hash. Attempting to push to the flash drive fails with
the message `! [rejected] master -> master (non-fast forward)` as the old copy
of the commits are still there.

To resolve this you need to throw away the matching set of changes on the flash
drive. To do this you can use git reset as follows, where `HEAD~1` should be
the number of commits you need to throw away (eg `HEAD~3` to throw away the
last 3 commits that were pushed to the flash drive):

    cd /media/flash/project.git
    git --bare log #to see how many changes don't have svn information
    git --bare reset HEAD~1

You can then push your changes as above.

    cd ~/project.git
    git push flash

I've glossed over subtleties with fetch vs pull, but hopefully you will find
this useful.

This howto makes use of git's ability to pull from multiple sources, and I've
found that git quite happily copes with changes that were checked in to svn
coming via the flash drive, even when later running "git-svn rebase".

Please do comment or contact me with any problems, errors, extra info and
feedback, and let me know if it was useful.
