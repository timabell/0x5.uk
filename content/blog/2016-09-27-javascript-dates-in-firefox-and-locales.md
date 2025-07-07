---
layout: post
title: javascript dates in firefox and locales
date: '2016-09-27T07:31:00.002Z'
author: Tim Abell
tags: 
modified_time: '2016-09-28T07:44:06.085Z'
blogger_id: tag:blogger.com,1999:blog-5082828566240519947.post-1701800026635188050
blogger_orig_url: https://timwise.blogspot.com/2016/09/javascript-dates-in-firefox-and-locales.html
---

Today I learnt:  

You actually have to reinstall firefox using a different download to get `new
Date(dateString)` to use a different date format (i.e. non-US).  

[https://jqueryvalidation.org/date-method/](https://jqueryvalidation.org/date-method/)  

> This method should not be used, since it relies on the `new Date`
> constructor, which behaves very differently across browsers and locales. Use
> `dateISO` instead or one of the locale specific methods (in localizations/
> and additional-methods.js).

So if you're using chocolatey or boxstarter like I am ([my boxstarter
script](https://gist.github.com/timabell/608fb680bfc920f372ac)) you need to add
the locale flag:
[https://chocolatey.org/packages/firefox](https://chocolatey.org/packages/firefox)  

`choco install Firefox -packageParameters "l=en-GB"`.  

Reinstalling the package with `--force` is sufficient to change it.  

It would seem chrome has no way change the format from `en-US`.  

To be clear the correct solution is to do as the documentation says and not use
that method, however it's a bit mean having a pitfall like that in the API. And
sometimes you just have to work with the code you have...
