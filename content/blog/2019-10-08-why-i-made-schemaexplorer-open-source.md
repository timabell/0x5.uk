---
title: Why I made SQL Schema Explorer open source
layout: post
---

# What is SQL Schema Explorer?

It's a database schema & data browser that can follow foreign keys and draw
diagrams that I spent years building because I wanted it to exist and I thought
it might make a good first product.

# Why charge?

I'm pretty busy these days but I like working on software and building things
like this, to justify the amount of time that goes in I can no longer just have
it as a time-consuming hobby. I've also been learning about entrepreneurship as
a possible extension or next step from time-for-money contract-programming
services.

The idea was that if I could get enough yearly subscribers to the software then
I could get balsamiq-like success and focus on making it better and better for
the people using it.

# Why open source now?

I got plenty of interest and interactions by my standards, more than I've ever
had for something I've published; but I never got more than one good friend paid
up beyond a generous trial. The conversations I had with people were full of
enthusiasm for the idea but not for parting with money to buy it. One
particular conversation was very positive until the idea of putting the
theoretical purchase in front of the manager was raised and then suddenly it
didn't seem viable at all; which I think speaks volumes. Useful, but not useful
enough to risk any political capital to get it, even for a pretty insignificant
amount of money.  I then had a coaching call with [Justin
Jackson](https://justinjackson.ca/) and as part of that he suggested putting it
to one side. Up to this point I'd been unable to leave the idea alone; it had
been something I really wanted to exist. I've always worked with relational
databases, and this seemed like a painful gap. At this point I had finally
added every feature that I'd ever dreamed it should have, and the intrinsic
motivation to just build for the sake of building was waning, and without the
demands from paying users for more features it's hard to justify continuing to
pour hours in even if it is on the train.

At this point there were 100 people on the mailing list (drip sent my first
bill!), one paying user/fan (Hello David! Many thanks!), and zero MRR (monthly
recurring revenue). I'd spent a bit of money on hosting (I'm still paying
digital ocean to keep the [demo site](http://demo.schemaexplorer.io/) up).

I didn't want to let down the few people who had really liked it by having it
just vanish into the ether like so many failed startups. Fortunately this is
downloadable and installable software, not a SaaS that would have to be shut
down. I've always liked the open-source ethos, and given this was no longer a
direct financial opportunity it made sense to me to give it away freely under a
copyleft license.

It feels like having this as a portfolio piece given I sell coding for a living
won't do me any harm, and it makes it easier to take with me to client
projects, where I can use it to help them improve their database.

# Schema Explorer for client work

Here's some things I've been using schema explorer for to help my contracting clients

* Finding missing foreign keys without looking up complex `pg_schema` queries
* Analysing data in tables and sharing screenshots with the teams
* Sharing screenshots of the generated diagrams to improve team understanding
* Using it as a tool for discussing database design
* Finding records needed for troubleshooting and debugging
* Improving my mental model of the database structure

# Tell me more

It's now [A-GPL](https://en.wikipedia.org/wiki/Affero_General_Public_License)
which requires sharing any modified source code even if you are just letting
users access the generated site. If I'm giving my years of hard work for free,
I think it's only fair to require people to contribute their improvements back
to the community.

You can find the source code at <https://github.com/timabell/schema-explorer>

# Feedback

Please do get in touch if this sparked a thought or interest. Just a simple
email will do <tim@timwise.co.uk>

Thanks for listening.
