---
layout: post
title: Multiple working folders for git on Windows XP
date: '2011-11-16T09:46:00.011Z'
author: Tim Abell
tags:
- howto
- windows
- git
- ntfs
modified_time: '2011-11-17T14:47:33.704Z'
blogger_id: tag:blogger.com,1999:blog-5082828566240519947.post-2649869241370803794
blogger_orig_url: https://timwise.blogspot.com/2011/11/multiple-working-folders-for-git-on.html
---

Multiple working folders for git on Windows XP (lucky me)

It is assumed that you have a git working copy of your project already in place
at `C:\code\myproject\` and that you want another copy of your project sharing
all history but with a different branch checked out at `C:\code\othercopy\`

This is useful for:

*   rapidly switching between branches where a switch would normally cause a
    time consuming recompile / rebuild
*   tracking the branch structure of Visual SourceSafe (which you aren't using
    in this century are you?) aka VSS aka Visual Source Shredder (or maybe TFS)

This can be achieved by use of [NTFS symbolic
links](http://en.wikipedia.org/wiki/NTFS_symbolic_link) (other related
keywords: junction points, reparse points, hard links). Grab [Sysinternals'
Junction](http://technet.microsoft.com/en-us/sysinternals/bb896768) to provide
access to NTFS symbolic links. Extract the contents and put `junction.exe` on
your path.

Word of warning for NTFS symbolic links in Windows XP:

*   Windows Explorer in XP doesn't know about the NTFS symbolic links, and if
    you delete the containing folder it will delete the real copy of your
    linked folder (facepalm). **Take backups first! You have been warned!**

Open a command prompt and run the following commands:

    cd c:\code\
    mkdir othercopy
    cd othercopy
    mkdir .git
    cd .git

    junction hooks C:\code\myproject\.git\hooks
    junction info C:\code\myproject\.git\info
    junction logs C:\code\myproject\.git\logs
    junction objects C:\code\myproject\.git\objects
    junction refs C:\code\myproject\.git\refs

    C:\code\othercopy\.git>copy C:\code\myproject\.git\* .

If you make a mistake, use `junction -d` to remove the branch point you have
created, **do not use explorer to delete a branch point** as it will delete all
your actual files.

You can now go into C:\code\othercopy\ and switch to a different branch, eg in git-bash:

    cd c:
    cd \code\othercopy\
    git branch mynewbranch
    git checkout -f mynewbranch

At this point you have two different checkouts sharing the same git data. Yay.

Word of warning for multiple working copies and
[git-extensions](http://code.google.com/p/gitextensions/):

*   Git extensions gets confused if you remove a branch that one of your
    working copies is on; and incorrectly shows the folder as uninitialised. To
    resolve this use the context menu in explorer or the console to force
    checkout a different branch.

This howto was written with "_git version 1.7.6.msysgit.0_" and _git-extensions v2.26_.

# References / see also

*   [http://finik.net/2010/10/24/multiple-working-folders-with-single-git-repository/](http://finik.net/2010/10/24/multiple-working-folders-with-single-git-repository/)
*   [http://en.wikipedia.org/wiki/NTFS_symbolic_link](http://en.wikipedia.org/wiki/NTFS_symbolic_link)
*   [http://technet.microsoft.com/en-us/sysinternals/bb896768](http://technet.microsoft.com/en-us/sysinternals/bb896768)
*   [http://code.google.com/p/gitextensions/](http://code.google.com/p/gitextensions/)
*   [http://elegantcode.com/2011/03/15/git-tfs-where-have-you-been-all-my-life/](http://elegantcode.com/2011/03/15/git-tfs-where-have-you-been-all-my-life/)
*   [http://github.com/spraints/git-tfs](http://github.com/spraints/git-tfs)
*   Scripts for creating and unlinking extra working copies:
    *   [https://gist.github.com/1373136](https://gist.github.com/1373136) - create
    *   [https://gist.github.com/1373142](https://gist.github.com/1373142) - remove
