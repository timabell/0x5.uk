---
layout: post
title: Unfinished hyperlinks - add a todo
date: '2013-05-25T10:03:00.001Z'
author: Tim Abell
tags:
modified_time: '2014-11-07T15:22:19.522Z'
blogger_id: tag:blogger.com,1999:blog-5082828566240519947.post-4587715440628289713
blogger_orig_url: https://timwise.blogspot.com/2013/05/unfinished-hyperlinks-add-todo.html
---

Just a quick post;

# Stop doing this

    href="#"


# Start doing this

    href="#todo"

# Why?

I'd like to promote a change to the habit of using '#' as the placeholder for a the url of a new hyperlink when you don't yet know where it'll link to: instead set the href to "#todo". This follows the //todo pattern recognised for unfinished code, and means you can now search your codebase for any links you forgot to finish off.

    <a href="#">new link</a>

becomes

    <a href="#todo" onclick="alert('Not Implemented');return false;">new link</a>

Demo: <a href="#">before</a> becomes <a href="#todo">after</a>


It will also give clues to any sharp-eyed testers / users that they should
report a bug for you as the url will change to #todo when the unfinished link
is clicked. It can often be seen in the status bar too.  This has the handy
side-effect of avoiding the annoying jump to the top of the page that is the
default behaviour when you click on a # link that's a placeholder.

For bonus points another little trick I like is to add a click handler with an
alert to make it really obvious to any early users / testers that this is not
done yet, and I've found this saves a lot of questions when you genuinely
haven't finished, and also guarantees a quick bug report when you should have
(not that I ever forget any of course :-D)

    <a href="#">new link</a>

becomes

    <a href="#todo" onclick="alert('Not Implemented');return false;">new link</a>

Demo: <a href="#">before</a> becomes <a href="#todo" onclick="alert('Not Implemented');return false;">after</a>

You can automate giving all these links an alert with the following (cheers to
"unknown" in the blogger comments)

    $("a[href=#todo]").click(function () { alert('Not implemented yet.') });

Simple and effective.

If you agree, please help spread the word. Perhaps by retweeting [my tweet](https://twitter.com/tim_abell/status/338235507203002368)

* * *

P.S. This goes hand in hand with a technique of picking points during development at which there should be no todo's left in your codebase with the exception of those with references to outstanding user story / bug numbers. I suggest before marking a user story as done, and at the end of each sprint as good points to review all todos in your codebase.

Further reading:

*   [The case against TODO - wordaligned.org](http://wordaligned.org/articles/todo)
*   [Using a JetBrains IDE to manage todos](http://blog.jetbrains.com/webide/2012/10/managing-todo/)
