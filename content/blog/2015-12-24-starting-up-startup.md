---
layout: post
title: Starting up a startup
date: '2015-12-24T18:06:00.002Z'
author: Tim Abell
tags:
- startup
modified_time: '2016-01-07T01:12:57.381Z'
blogger_id: tag:blogger.com,1999:blog-5082828566240519947.post-3805274102521054822
blogger_orig_url: https://timwise.blogspot.com/2015/12/starting-up-startup.html
---

I've been contracting for 3 years now, which fits nicely with my drive to have real customers and build business(es). But I still have an itch. I've now found something to scratch that itch (taking the metaphor too far, sorry about that).  

I'm going to write about my latest adventure here, from the perspective of me as a coder who's aspiring to be an entrepreneur, so if you're interested in my personal journey on this then do add my blog to your rss reader etc. of choice. I'll try and tag them all with startup so you can filter if you aren't interested in my other ramblings :-)  

This post tells the story how I got involved in this startup, and some of the technical choices made so far and what we have in place already.  

_So here's how it started for me:_  

I found out via twitter that the the [startup britain bus](http://www.startupbritain.org/bus-tour) was coming to Reading, so I went to say hi. They were a friendly crowd, and whilst there I found out that there's actually a new startup group in the area called [ConnectTVT](http://www.connecttvt.co.uk/) associated with the new co-working space called [grow@greenpark](http://growgreenpark.co.uk/) over in green park just off M4 J11\. That beats traipsing into the big smoke for me and is just the kind of melting pot I've been looking for. I know plenty of tech folks given that I'm a professional coder, but it doesn't seem sensible for me to start a business with people with the same skills and the same blindspots as me. None of my "normal" friends seem to have the same entrepreneurial itch that I do; I needed a broader pool. I went straight from the bus to grow to check it out and met some more lovely friendly people. A few weeks later (I think) I went back again for one of their startup grinds to see what was going on. There was a small group of interesting people with diverse interests and talents, from accountants to designers and a few tech folk. One of the people there, [Richard](http://somelivingroom.blogspot.co.uk/), had an elevator pitch for a new take on the property market which made some sense to me and seemed well received by the group. All the people there offered their various advice and help. Richard has had experience in the property market that's led him to this insight and having mulled over the idea for quite some time was interested in how this concept might become something more real. Lacking the tech background to just go and build it himself he was interested in what kind of scale of task this might be and how to find people who could help. I offered to provide advice any time and passed Richard my contact details. I didn't at that point have any plans to get further involved.  

I very much enjoyed meeting everyone, and went home with a head full of ideas and inspiration. I found myself still thinking it all through in the small hours that night, regularly grabbing my phone to make yet another note on the [trello](https://trello.com/) app detailing some idea about this property thing and how it could work, how you might get over the network-effect bump etc. Clearly this wasn't going away. So I messaged [Louize](https://www.linkedin.com/in/louize) who runs the meetup to get in contact with Richard and said it had been keeping me awake with ideas, and she got us in contact again.  

After mulling the whole thing over for a bit longer, it occurred to me that there is no reason I couldn't do more than just provide advice, and maybe I should offer to provide a more concrete involvement. After all, I think the idea is great, and it's not like I'm busy making any of my other ideas I have into businesses yet. Richard would certainly be much better able to build at a much lower financial risk with a technical co-founder. So after a load more discussions around the idea, the odd trip to the pub and some discussions around practical arrangements that is now what we are doing.  

_How's it going?_  

The first thing has been to really understand Richard's vision, this has mostly involved talking lots. I set up a trello board for the startup, and that's been great for doing a brain dump of all the ideas and todos, and getting them into some sort of organisation, then moving them into "do later" or "needed for launch" kind of groupings. I've also pointed Richard at [balsamiq mockups](https://balsamiq.com/products/mockups/), which these days has a slick web based editor and presentation mode. I've used it in the past to great effect when helping stakeholders in other projects understand what they're really likely to get before all the expense of building the wrong thing. In this startup it's already been really useful for hashing out ideas of how the site might work and even for getting reactions and insight by way of putting it in front of people and seeing if they understand the concept and how you would use it if it were a real thing already. Inspiration for this process is taken from the excellent book [Don't Make Me Think](http://www.amazon.co.uk/Dont-Make-Think-Revisited-Usability/dp/0321965515).  

_Hosting choices..._  

In terms of building something real, Richard bought a domain, so we have somewhere to put it. I spent forever over [technical choices](http://www.commitstrip.com/en/2015/12/09/this-language-sucks/) because basically you _could_ use just about any technology stack, any programming language, cloud PaaS, IaaS or private servers etc. and in fact they would all work. There's actually nothing to completely rule out anything. Some great things have been built on top of apparently terrible technical choices (wordpress is lovely but php that it's built with is known for being buggy and hacky). There's much stock put in "cloud" these days, and it does have benefits such as infinite scalability (of your wallet), but it comes with an overhead of complexity and potentially vendor lockin (though that like everything can be mitigated). So call me a luddite but I've gone for an old fashioned linux VPS (virtual private server) where I can easily put a ceiling on costs till we have an income. Unlike so many modern startups that rely on farming people with free shiny stuff until they have enough they can magically make money off the back of them, burning VC cash all the while in the name of profitless growth, we're going to provide users with value, and charge them appropriately for that value, which naturally puts the brakes on the kind of explosive growth of free users that can overwhelm an ambitious startup's site. So I've made a decision at last, hunted around for a provider I could trust and bought some hosting. There's a lot to choose from so I needed a way to narrow down the field, especially given there's a lot of not very good and not very well supported VPS offerings out there. I thought there might be an advert in [Linux Voice](https://www.linuxvoice.com/) magazine, which is where I found my uber-geeky ISP [A&A](http://aa.net.uk/) (check out the [boss's blog](http://www.revk.uk/) if you want to know how far that rabbit hole goes), but there weren't any. So I hopped on #linuxvoice on freenode irc and asked in there, and sure enough the good folks at the mag said they'd been using [bytemark](https://www.bytemark.co.uk/) and had been happy with their support. Sold.  

So I bought bytemark's basic VPS offering, and now have a server on the internet that I can point everything at and run everything we need on no matter how quirky the needs. While we have a manageable number of users this should suffice, we're not planning any multi-million pound TV adverts any time soon. I expect if we're successful we'll have growing pains no matter what platform we're using, it's non-trivial to scale even if you're on a so-called scalable platform in the first place. There's lots of gotchas, unexpected interactions and bottlenecks in any system as it grows.  

If it sounds like I'm trying to rationalise my decision that's because I am, I'm aware that whatever technical (and even non-technical) decisions are made at this earliest of early stages have rippling effects that are hard to reverse once you build more on top of them. However equally no matter which choices you make, none of them are truly irreversible, and there are myriad ways of tackling any of the problems that come your way in time. I've had the privilege of seeing teams that are running decent scale operations in both .net and ruby on rails, which are two very different platforms with different cultures and different sets of problems, but interestingly the difference in the overall scale of the challenge and how easy it is to get things done in the long haul was not noticeably different as far as I could tell.  

_Mailing lists and landing pages:_  

The first goal is to have a way to let interested people know when we've got things to show them, tell them the story, and when we need their help. That means a mailing list. Bulk email isn't for the feint hearted these days in the modern world of aggressive spam filters, SPF (no not sunblock), domain keys and increasingly rigid legal constraints as we try to fight outright spam on the wild west of the internet so I don't fancy doing it all myself. My go-to service for this is [mailchimp](http://mailchimp.com/), and I haven't been disappointed. But for this to work we need an email address, and that means MX records and pointing it at some mailserver somewhere. I did look into gmail as a possible shared mailbox but it doesn't seem to do what we're after, so now I have a server running anyway I can just use that. No artificial limits, no snooping, no unwanted advertising.  

It turns out that bytemark provide a very nice customised build of debian called [symbiosis](http://symbiosis.bytemark.co.uk/), which has a bunch of useful services already installed, and a watchdog service that'll restart anything that's fallen over. Nice! It didn't take me much fiddling to get the basic web hosting to behave and get an email account on it set up. I then used the domain control panel to point the A & MX records at our shiny new server (by way of a bit of chaining of CNAMES which will be slightly slower for the first lookup but will be easier to maintain). I then had to redo the web and mail hosting because I hadn't realised that bytemark had made the server do multiple domain hosting using a neat folder based system, but that didn't take too long and it's all good learning time without customers breathing down one's neck!  

I've now done a rudimentary holding page for the domain, with a sign-up form for the mailing list, which was goal number one. You can see it here: [http://www.xchain.co.uk/](http://www.xchain.co.uk/). If you're interested in the concept or progress then please do sign up to the mailing list. It's easy to unsubscribe if you get bored of it ;-)  

I've added [google analytics](https://www.google.com/analytics/) to the site, which is very useful albeit slightly evil, so at least we'll have some idea if it's getting any traction as we start to spread the word (taking all stats on the internet as extremely approximate of course). I might switch to one of the more libre solutions at some point but that would require a bit more time and this is after-all a commercial venture and not an open source project. Much as I like working on open source for the greater good, I haven't yet managed to make it pay the bills. I think it's important to have metrics for a startup so you can tell if what you're doing to spread the word is actually having any effect, and what might be putting off potential customers.  

We've sent out a mailing or two to the few people we've got signed up at this early stage (hello mum!) as much for practice as anything, and I'm impressed with mailchimp's collaborative capabilities and previewing system.  

_Tech stack_  

You may have noticed I still haven't entirely picked a stack, nothing I have so far has locked me in to a decision. I don't want to be paying for or locked in to Microsoft's world (and the associated treadmill of change), so although I do their stuff for a living I don't want to tie my own startup to them, so that's out. I'd prefer an open source stack as I think it matters whether you enjoy working on the platform you've chosen, and open source is just so much nicer to work with as a coder / dev-ops. Currently I'm thinking a golang based server, backed with postgresql (the industry's finest database) serving up a JSON/REST API to an AngularJS + Foundation frontend. This gives us scope to rework the different parts as needed, and to bolt on dedicated mobile apps later.  

_Web design_  

There's no design in the current holding page as I am no designer (frustratingly, but that's a whole other career path), and we're still working out how to pull design talent into the whole shebang in a sustainable way. Richard has put me onto [webflow](https://webflow.com/), which maybe will get us started.  

My first learning of trying to find a freelance designer was that I need a "web designer" not just a "designer", being from the web world I hadn't appreciated the importance of the prefix and attracted all the wrong people.  

_Further reading..._  

Having this startup has encouraged me to broaden my reading and listening habits further. Here's some of things I've been catching up with:  

*   [Regret minimization vid](https://youtu.be/jwG_qR6XmDQ) - inspiration from Bezos
*   [What is code](http://www.bloomberg.com/graphics/2015-paul-ford-what-is-code/) - explains what I do to the non-coders
*   [HanselMinutes - Startup Accelerators](http://hanselminutes.com/506/todays-startup-accelerators-john-henry-from-cofound-harlem) - a timely podcast show
*   The [Startup Chat podcast](https://wpcurve.com/startupchat/) from WPCurve
*   Last year's [startup resolutions](http://www.entrepreneur.com/article/241085) via the [work in startups](http://workinstartups.com/) mailing list
*   Everything in [LeanStack's blog](http://leanstack.com/blog/)

 --  

Please do drop me a line if you found this interesting in any way. [tim@timwise.co.uk](mailto:tim@timwise.co.uk) works best for me.
