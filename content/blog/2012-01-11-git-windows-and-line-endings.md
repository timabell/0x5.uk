---
layout: post
title: Git, Windows and Line endings
date: '2012-01-11T09:05:00.009Z'
author: Tim Abell
tags:
- windows
- git
- critique
modified_time: '2012-05-10T10:36:45.076Z'
blogger_id: tag:blogger.com,1999:blog-5082828566240519947.post-5718834994106059896
blogger_orig_url: https://timwise.blogspot.com/2012/01/git-windows-and-line-endings.html
---

I have come to the unfortunate conclusion that git is not the perfect tool for
teams developing exclusively on Windows. And by that I mean, I cannot recommend
it unconditionally as I would like to be able to do.

<div class="flickr-pic">
<a href="https://www.flickr.com/photos/tim_abell/6375201587/"><img
src="https://live.staticflickr.com/6237/6375201587_3a4b7d4a19.jpg"
alt="Slightly amusing photo of for-sale sign in a bin"></a>
</div>

The main competition I would be considering is Microsoft's TFS.

I have had plenty of experience working with git under windows (as well as on
linux), and what follows are the three reasons I can't wholeheartedly recommend
git to a pure windows team. There are of course many reasons to avoid the
alternatives, but that is outside the scope of what I wanted to say here.

Just for the record, in spite of these flaws, I still think git is the best
thing since sliced bread.

# File renaming

This is an outright bug that unfortunately the msysgit developers have chosen
not to address (as is their prerogative), and I don't have the resources needed
to provide a patch of sufficient quality or run my own variant of msysgit.

* [Git-for-windows page on all the case issues](https://github.com/git-for-windows/git/wiki/File-names,-Branch-names,-Path-quotation,-Executable-bit-and-file-modes,-core.FileMod://github.com/git-for-windows/git/wiki/File-names,-Branch-names,-Path-quotation,-Executable-bit-and-file-modes,-core.FileMode)

The simple test is to change the case of a file's name, which fails, however
most obvious workaround (rename to another file name in one commit, and back
again in another) actually makes the problem worse. This is because the bug
also affects checkouts, so when git on another team member's machine attempts
to update the working copy directly from its previous state directly to the
requested revision (usually the latest), the "checkout" fails half way through
leaving the team member flummoxed.

This is a particularly insidious bug for a team. You will generally have some
people who are stronger with git (or pick it up quickly), and some who are not
interested or struggle with the new system. Unfortunately if your team trips
over this bug, *every* team member will have to work out how to get past it,
and it is not immediately obvious from the symptoms what the problem might be
or how to solve it. It also leaves the victim's source directory in an
inconsistent state, so if they try to ignore the problem and carry on they will
get into more of a pickle.

Having to notify every member of your team that you have changed the case of a
file and point them to a workaround is hardly going to endear them to their new
fangled source control "git".

A real world example of why this might happen:

File in your source tree that has been around since before you had any naming
conventions: "_VATRate.cs_" containing a _VATRate_ class. (Value Added Tax).
You now enforce a naming convention where Acronyms are in Pascal case, i.e.
_VatRate_. In order to rename the class you must also rename the file,
therefore _VATRate.cs_ is renamed to _VatRate.cs_, triggering the above bug for
your entire team whenever they happen to fetch (and worse every time they
switch between branches that do / don't have the patch).

# Line Endings

As you know from the depths of history, our beloved operating systems have
chosen different line ending systems:

*   Mac: CR
*   Windows: CRLF
*   Linux/Unix: LF

Git has an ingenious way of handling this, and gives you three choices for
handling cross platform differences (see [git config /
core.autocrlf](http://linux.die.net/man/1/git-config)):

1.  Leave them the hell alone (_false_)
2.  Store them in git as LF and convert them on checkin/checkout (_auto_)
3.  convert them when you checkin a file but not on checkout (_input_)

Which in theory is fine and dandy, and either of the first two should both be
fine for a pure windows team... if it wasn't for the patch tools. It would seem
that as soon as you start applying patches and using some of the more advanced
tools that come with git, they introduce inconsistent line endings into checked
in files. You also have an issue with the configuration being client side, so
it is likely one of your team members will get the setting wrong one day and
make a mess.

In my experience, neither of the first two settings are painless under windows,
leaving you with a constant overhead of meaningless / noisy diffs, and time
spent troubleshooting, and running tools to tidy up files that have had their
line endings corrupted.

It's not a show-stopper, but it does make it harder to recommend that a team
avoid TFS (for example) and use the "better" solution with all its benefits.

# Unicode file handling

I may not have my facts completely straight on this one as I'm no expert in
this area, so please forgive me and provide any corrections / references you
can in the comments.

Visual Studio has a tendency to add a byte order marker to source files. Which
as far as I know is fine. Unfortunately git then is inclined to interpret the
file as binary and refuse to show diffs.

(I'm a little uncertain on this one, but I have seen the symptoms first hand,
and it happens more than is comfortable)

# Footnote: Speed

Git is held up as an example of fast source control, and seems faster than
anything else I've used, however it's also worth mentioning that rewriting
commit histories (rebase), refreshing the status and tab-completion are (last
time I checked) all significantly slower on msysgit (windows) than git on
linux.
