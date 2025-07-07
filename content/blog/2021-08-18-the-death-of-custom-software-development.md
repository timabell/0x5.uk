---
title: The death of custom software development
layout: post
---

I've been around this industry for a long time and have been quietly observing the bigger trends while I fiddle around with the details of software.
Here's what I've noticed: writing software by hand is doomed. Expect that it isn't, and it's a bit more nuanced than that.

I think the industrial revolution and the creation and growth of engineering as a profession is a good way to think about the progression of the software profession in the large.

## The long view - the birth of payroll software

A few years ago I decided to get a bit stronger (being your typically feeble software engineer at the time) and joined a Nuffield gym and took them up on their personal training options so that I wouldn't injure myself picking up the first 1kg weight I found in the gym. The PT I got happened to be a lovely older chap named Bryan, who is a very calm and experienced trainer who really helped me build some useful real-world strength through the medium of increasingly heavy kettle-bells and other such devices, all without injury. Now obviously we got talking as we spent many hours on turning me into a proper human, and it turns out that Bryan used to work for the might HP (the computer company not the sauce) of all things, and was part of the software world for many years before I joined it amidst the dot-com mania. I have heard talk of people writing custom payroll systems in the past, but Bryan actually lived it and it was great hearing the stories. In many ways nothing much has changed; software engineers write custom software to solve some pressing business problem for the big businesses that can afford it, and everyone else gets by with bits of paper or whatever they can pull together. The software engineers complain about the hardware engineers, the hardware engineers complain about the software engineers, the sales people sell things that are expensive to do and the software engineers grumble and try and make good. There are fascinating stories of obscure bugs where you have to drill all the way down to the compiler or hardware to find the true source; the stuff of coder legends. All this was true then and is true now.

"That's all very well", you say, but what's that got to do with me? Well I think some of the systems Bryan worked on are illustrative of the geological shifts in software over the years, and are indicative of changes happening to this day and still to come.

In that era, there was no good off-the-shelf payroll software that could solve every business's payroll needs, and every business needs to pay its staff. Doing it by hand is laborious and error prone which makes it a good candidate for turning into software. The in-house custom coding crowd got there first and made it work for big businesses that could afford development teams or the equivalent consultancy fees. Then vendors started to show up but there were edges that they couldn't handle so there was still room for custom code, and now it would be [almost] madness to start a payroll software company (though you might find a way to disrupt the existing players like Sage, but it's not going to be all green fields for the taking like it was back then).

## The trend of commoditization and the shrinking need for custom code

"So what", you say, "there's still vast plains of untouched lands for software development, coding will never die! Coders unite!"

As the really big universal problems are picked off one by one there is indeed still plenty of room, for now at least, for custom code.

(By big universal problems I mean things like: accounting, payroll, Enterprise Resource Planning aka ERP, development tooling, website creation, online payments, social media, buying and selling privately online, car-sharing, short-term property rentals, travel bookings, etc. etc.)


Some organisations will always think they are too special or have too much ego invested in rolling their own (not-invented-here syndrome) to buy an off the shelf options. This is inefficient, but will happen nonetheless if they want to pay for it.

There will always be innovation and disruption, which will require engineering effort. Even in the age-old physical realm of engineering such as building roads, bridges and buildings there continues to be innovation and a need for skilled highway and bridge engineers.

Undeniably, however, there are whole classes of problems that software is capable of solving that have already been solved (some better than others of course), and a market of off the shelf or open source software dominates each particular problem leaving little room for expensive one-off custom builds to solve the same problem again.

As each vendor gets better at solving the problem at hand (or gets disrupted when they fail to), more and more use cases that used to require custom code are served by off-the-shelf software eliminating the need for developer time and replacing it with more-or-less need for installation, setup and configuration expertise.

## The end-game for software development

In the very long run (maybe another 100 years?) I see us getting to a steady state much like exists in traditional physical engineering. There are no vast new uncharted problem spaces waiting to return billions of dollars just for being first to get there. There will still be the occasional disruption but we'll look back on the dot-com boom in the late '90s just like we look back on the industrial revolution and the creation of railroads for the first time. We'll still have railroads, and we'll still have social media platforms and SaaS businesses; and sometimes one company will die and be replaced by others; but we won't be awestruck by silicon valley's ability to turn the world on it's head any more. It will just be normal.

As for the software developers and their trade; they won't go extinct, they'll probably have the same job titles more or less. There will be more developers working for the SaaS companies, infrastructure companies and boxed software companies (locally installed software will never die), and less developers working for businesses that aren't fundamentally software businesses. The latter will just buy the outputs of the software companies for far less than they would have had to pay a development team or outsourcer.

## Developer salaries

Companies that have money will always pay good money for good people, and software businesses serving worldwide business and consumer markets with software that costs nothing to replicate will always have plenty of money.

The "shortage" of software developers caused by the collapse in interest in computer science degrees after the dot-com bust combined with ever increasing production of software has already started to be mitigated as the "boot camp" model that has been running for a few years now at scale is starting to result in volumes of quality and sufficiently experienced engineers. This will push prices for the "average" developer down. In fact prices of the average developer haven't really moved much in the last 20 years in spite of the effects of inflation eating away at the real value of that income. £50-60k is still a reasonable salary for an experienced engineer in an average job in the UK just like it has been for years, while house prices have rocketed up in that time.

So in the long run apart from people that can make themselves invaluable to the richest companies (which takes more than being able to write Python or C#) will still be well rewarded, but the days of exceptional salaries for anyone that can write a `for` loop let alone recursion are well behind us now.

## The fractures and integrations between software

An interesting effect of the ever-growing amount of coverage of off-the-shelf software and SaaS companies in the global problem-space of business is the rising challenges and expectations for making it all work together (often known as "systems integration").

For sectors where there are many similar businesses (think plumbers, accountants, travel agents), the software vendors will produce solutions that cover everything that the profession needs all in one offering (marketing, finance tracking, invoicing, customer contact etc.). They can do this cost-effectively by selling the same thing repeatedly for near-zero marginal cost.

Bigger more complicated businesses, or more unique businesses are left trying to avoid building everything they need from scratch and instead trying to cobble together a complete solution for their business from all the various SaaS and on-site offerings that are out there.

As businesses put solutions in place for each problem they have to solve, they then start looking at how well these things are working together, and mostly discover that they aren't. One SaaS thinks it has the answer to everything but is wrong, another on-site system thinks it owns the data about customers but the cloud-based CRM has got out of sync again and they keep upsetting customers by getting their facts wrong. So sometimes they just paper over the cracks with people based processes and spreadsheets. Sometimes they hire developers to try and glue systems together that really don't want to be glued together (through the magic of dubious quality APIs or maybe direct SQL database access).

Some bits of software provide value as a standalone thing (e.g. document or chat tools), but even with those there's a drive to integrate (e.g. single sign-on to avoid access for previous employees, auditing and storage for compliance etc). Other bits of software are very painful to leave disconnected (e.g. a storefront in Magento where customers purchase goods and an inventory ordering/management (ERP) system in SAP Business One that makes sure there's anything to ship).

To solve this latest self-inflicted pain of the software world a whole new class of software has emerged who's only job is to join systems together that don't know how to connect directly, or to act as an orchestrator of all the flows of data. You might have seen IFTTT (If This Then That) which is the consumer-centric version of this where you can make any number of events in one SaaS trigger actions elsewhere. Another is Business Process Automation (BPA) such as Codeless BPA which connect all sorts of enterprise software together by hook or by crook, while giving a central place to manage the flow of data and massage and monitor it on the way through as needed.

But even *that* extra layer of connection still doesn't always give us the magical point and click connection we were promised decades ago where you can make your whole business work without talking to any nerds. For simpler cases you might get lucky, but as soon as you have to make a web hook work many people just glaze over and reach for the phone. And if something stops working between two bits of software that don't really like each other, and your business's whole income depends on that data flow, you're going to do whatever it takes to make it behave again. So in a slightly different shape we find ourselves yet again in need of a vast army of technical folks who really know what's going on and how to work the magic to make the wheels turn again and the ones and zeros flow like a spring down a mountain-side.

## Service buses and event sourcing

One of my tech friends mentioned this (very technical) approach to solving the pains.  This is a really good point, as you can get better more scalable, more fault tolerant and more responsive systems with these approaches. The move to this approach is however contingent on either the vendors playing ball, or on your systems being sufficiently hand-coded already that you can make these kinds of architectural improvements. YMMV as they say. An interesting aside that's worth being aware of and considering. I won't go into what they are here as there's tons of content out there on this.

## AI (Artificial Intelligence) and Machine Learning (ML)

A hot topic of the day is AI and ML. These are growth areas for good reason as they can eliminate whole swathes of formerly labour intensive work, but personally I don't see programming in any meaningful sense as being one of them. I might be a bit biased of course. If anything this is likely to spawn yet more need for highly capably technical folks to build and integrate these new systems, regardless of where the boundaries of each system sits.

## A new consultancy

Yes there was a reason I was even thinking about this, let alone writing it down, but this isn't really a pitch; I genuinely find this stuff interesting to think and write about.

I'm building a new systems integration business off the back of my experience in tech, so if that's relevant to you drop me an email <mailto:tim@timwise.co.uk> and let's talk. I'm looking to build my network of people who I/we can help, and also my network of people who might want to be involved in the new business.

## A penny for your thoughts

I'd love to talk to you *on an actual phone call* if you thought this was interesting or relevant (or wrong or silly!)

Drop me a line on <mailto:tim@timwise.co.uk> and arrange a call!

## Footnotes

### Many names of non-custom software

Sometimes you may hear software referred to as COTS, which is short for "Commercial Off The Shelf" software, or "boxed software". These days you might call that codeless, no-code or low-code. Or maybe "apps". The point here is that you don't have to pay developers to solve a problem (which is expensive, slow and error prone - good for developers paid for their time and skills, not so good for the business paying the bill).
