---
layout: post
title: configuring kdiff3 as a mergetool in msysgit
date: '2010-09-03T08:31:00.004Z'
author: Tim Abell
tags:
- windows
- git
- kdiff3
modified_time: '2011-01-14T11:56:40.103Z'
blogger_id: tag:blogger.com,1999:blog-5082828566240519947.post-362080553431078830
blogger_orig_url: https://timwise.blogspot.com/2010/09/configuring-kdiff3-as-mergetool-in.html
---

How to configure kdiff3 as a mergetool in msysgit. (I think if you install kdiff3 *before* msysgit it is picked up automatically, if not, do the following after installing both).  

In git bash:

```
git config --global merge.tool kdiff3
git config --global mergetool.kdiff3.path "c:\Program Files\KDiff3\kdiff3.exe"
```

double check:  

```
cat ~/.gitconfig
[merge]
	tool = kdiff3
[mergetool "kdiff3"]
	path = c:\\Program Files\\KDiff3\\kdiff3.exe
```

refs:  

*   [http://markmail.org/message/dvrnn7ilprvinrfp#query:msysgit%20kdiff3%20.gitconfig+page:1+mid:dvrnn7ilprvinrfp+state:results](http://markmail.org/message/dvrnn7ilprvinrfp#query:msysgit%20kdiff3%20.gitconfig+page:1+mid:dvrnn7ilprvinrfp+state:results)
*   [http://www.kernel.org/pub/software/scm/git/docs/git-config.html](http://www.kernel.org/pub/software/scm/git/docs/git-config.html)  

Under cygwin, the setup would be:  

```
git config --global merge.tool kdiff3
git config --global mergetool.kdiff3.path /cygdrive/c/Program\ Files\ \(x86\)/KDiff3/kdiff3.exe
```

Giving the config file contents:  

```
[merge]
	tool = kdiff3
[mergetool "kdiff3"]
	path = /cygdrive/c/Program Files (x86)/KDiff3/kdiff3.exe
```

Which by the way you can view with  

```
git config -e --global
```
