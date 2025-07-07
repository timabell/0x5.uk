---
layout: post
title: Why publish open source when you are commercial?
date: '2014-03-08T19:07:00.000Z'
author: Tim Abell
tags:
modified_time: '2014-03-08T19:07:01.451Z'
blogger_id: tag:blogger.com,1999:blog-5082828566240519947.post-5055561057000769363
blogger_orig_url: https://timwise.blogspot.com/2014/03/why-publish-open-source-when-you-are.html
---

Why open source your commercial projects?

*   Forces you to decouple them from other internal systems.
*   Encourages thinking in terms of reusable modules, which is better for
    internal reuse just as much as public reuse.
*   Possibility of contributions to systems useful to your business by others.
*   Easier reuse within your organisation (the public internet is a better
    search and sharing system than any internal systems).
*   Reputation advantages, the best coders often like to work in open and
    forward-thinking companies, and having public shared code is a great sign
    of such an organisation.

Do it early

*   Preferably push your very first commit straight to github.
*   Do it before it has a chance to be tightly coupled to internal systems,
    otherwise you'll have to unpick it and it will be less decoupled from day
    one, and inertia might mean that in spite of the best intentions you then
    never publish it.
*   You'll have it in mind that every commit is public from day one, avoiding
    adding internal config etc and forcing you to factor it out into config
    which is all round a good thing.
*   Don't wait for your code to be perfect, there are compromises in all code
    and sharing something imperfect is better than sharing nothing.

<div class="flickr-pic">
<a href="https://www.flickr.com/photos/tim_abell/12293521763/in/photostream/"><img
src="https://live.staticflickr.com/3756/12293521763_39d7704c73_k.jpg"
alt="People on the beach with a clifftop"></a>
</div>

Worried about the brand?

*   Commit under personal email addresses and push to personal github accounts.
    You can always setup a corporate github account later when you are feeling
    more confident.

Of course I'm not saying you should open source everything, for example your
core product's codebase should probably not go on github if you are a product
company!

_Be brave, be open._

Props to [Tom Loosemoore](https://twitter.com/tomskitomski)
