---
layout: post
title: Removing the execute flag from many files
date: '2008-05-17T20:33:00.003Z'
author: Tim Abell
tags:
- howto
- linux
- bash
- microsoft
modified_time: '2008-05-17T20:37:24.778Z'
blogger_id: tag:blogger.com,1999:blog-5082828566240519947.post-4979805774645728647
blogger_orig_url: https://timwise.blogspot.com/2008/05/removing-execute-flag-from-many-files.html
---

Here's how to recursively remove execute permissions on files that have been copied from a windows system.  

`find * -type f -exec chmod -x {} \;`  

ie, find all files (not directories), and execute a command to remove all execute permissions for each file.
