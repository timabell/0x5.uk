---
layout: post
title: backuppc and windows vista
date: '2009-10-23T01:51:00.005Z'
author: Tim Abell
tags:
- howto
- backup
- vista
- windows
- linux
- wip
modified_time: '2009-10-24T22:29:34.727Z'
blogger_id: tag:blogger.com,1999:blog-5082828566240519947.post-1285384210635406754
blogger_orig_url: https://timwise.blogspot.com/2009/10/backuppc-and-windows-vista.html
---

Steps I took to get a [backuppc](http://backuppc.sourceforge.net/) server on an
ubuntu 8.10 pc in order to be able to back up a windows vista business pc. I've
only documented the non-obvious and undocumented items here.

*   Added a user called backup to the vista pc.
*   Added the backup user to the "administrators" group. I tried the "backup
    operators" group but it didn't give access to the user profiles. It looks
    like robocopy has some black magic that allows it to bypass ACLs when a
    member of backup operators.
*   Enabled admin shares (ie `\\machine\C$`) by adding `DWORD` registry key
    `LocalAccountTokenFilterPolicy` to
    `HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System`
    and setting the value to `1`. See [How to access Administrative Shares on
    Vista
    (C$)](http://www.paulspoerry.com/2007/05/09/how-to-access-administrative-shares-on-vista-c/)
    by PaulSpoerry
*   Removed the `-N` from the `SmbClientFullCmd` etc options in backuppc's
    transfer (`xfer`) settings as it didn't seem to be using the provided
    password. Troubleshooting was aided by running
    `/usr/share/backuppc/bin/BackupPC_dump -v -f vistamachine` directly as user
    backuppc.
*   [Hide the backup
    user](http://forums.techarena.in/vista-administration/689162.htm#post2788050)
    from the welcome screen by adding `DWORD`
    `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows
    NT\CurrentVersion\Winlogon\SpecialAccounts\UserList\backup` with value `0`
    to the registry. "backup" is the name of the user to hide, `0` means hide,
    `1` means show.

Enjoy.

See also:

* [ubuntu backuppc/vista
    guide](https://help.ubuntu.com/community/BackupPC/smb)

Current status: This has only been partially successful so far. The backup runs
but has lots of files missing due access denied errors on many of the important
folders. It looks like I will have to manually give "backup operators"
permissions to these folders. Sigh. Vista is proving to be less than easy for
me to support.
