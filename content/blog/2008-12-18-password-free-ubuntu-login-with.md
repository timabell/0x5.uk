---
layout: post
title: password-free ubuntu login with facebrowser
date: '2008-12-18T21:27:00.002Z'
author: Tim Abell
tags:
- howto
- ubuntu
- linux
modified_time: '2009-04-04T00:31:35.019Z'
blogger_id: tag:blogger.com,1999:blog-5082828566240519947.post-7416804086430204798
blogger_orig_url: https://timwise.blogspot.com/2008/12/password-free-ubuntu-login-with.html
---

If you trust everyone who has physical access to a pc (if not then you are
encrypting your files, right?) then there seems little point in having to type
a password just because more than one user uses the pc.

So here's how to log in from the gdm "face browser" with a single click.
Instructions tested with Ubuntu 8.04 Hardy Heron and 8.10 Intrepid Ibex.

As root, create a new file containing the usernames of all the users you want
be able to log in through gdm without entering a password:

    sudo -i
    echo 'username' >> /etc/gdm/nopassusers

now still as root modify the pam settings for gdm to check this file and allow this user in based on being in the list:

    vi /etc/pam.d/gdm

and modify to contain the new listfile item

    #%PAM-1.0
    auth requisite pam_nologin.so
    auth required pam_env.so readenv=1
    auth required pam_env.so readenv=1 envfile=/etc/default/locale
    **auth sufficient pam_listfile.so item=user sense=allow file=/etc/gdm/nopassusers onerr=fail** #add this line
    @include common-auth
    auth optional pam_gnome_keyring.so
    @include common-account
    session required pam_limits.so
    @include common-session
    session optional pam_gnome_keyring.so auto_start
    @include common-password

now simply restart gdm (or the whole machine) and try your new one-click login

    /etc/init.d/gdm restart

# Notes

This means the keyring isn't unlocked, so you may have to type in your password anyway before your wireless connects.
# References

* [http://mirror.hamakor.org.il/archives/linux-il/05-2004/10149.html](http://mirror.hamakor.org.il/archives/linux-il/05-2004/10149.html)
* [http://www.kernel.org/pub/linux/libs/pam/Linux-PAM-html/sag-pam_listfile.html](http://www.kernel.org/pub/linux/libs/pam/Linux-PAM-html/sag-pam_listfile.html)
