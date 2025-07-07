---
layout: post
title: Returning to commercial ASP.NET from Ruby on Rails
date: '2014-01-07T13:17:00.002Z'
author: Tim Abell
tags:
modified_time: '2016-11-17T00:23:37.813Z'
blogger_id: tag:blogger.com,1999:blog-5082828566240519947.post-3544561153334601161
blogger_orig_url: https://timwise.blogspot.com/2014/01/returning-to-commercial-aspnet-from.html
---

Why ASP.NET again after all the noise I made about Ruby on Rails? After a brief stint with commercial Ruby on Rails development I should explain why I've decided my next gig will be an ASP.NET project. In short: currently almost all the Rails work available is in London for digital agencies and start-ups, demanding on-site full time presence, and I burned out doing 3 hours a day commuting in less than half-a-year. This is not a sustainable business plan.

The emphasis on start-ups and agencies bodes well for the commercial future of Rails as many of these projects will bloom into large systems needing continuing development. But for me the market in the Reading area seems too quiet to make a business success from just Rails. The final straw was being formally offered a rare local permanent Rails job working with all my favourite open source technologies (Rails, Postgres, Linux etc) only to be handed an employment contract with less job security, rights and benefits than a contractor would have. This confirmed my growing understanding of the local market not being suitable.

So, my updated plan of action is to return to providing programming services to the vibrant .NET market in the local area.

<div class="flickr-pic">
<a href="https://www.flickr.com/photos/tim_abell/11677745506/"><img
src="https://live.staticflickr.com/5548/11677745506_674ad8e0d5_k.jpg" alt="Fireworks over Reading, a moody nightscape."></a>
</div>

This article is for my Linked In audience, if you want to become part of my network or learn more about my professional services send me a message or invite here: [http://www.linkedin.com/in/timabell](http://www.linkedin.com/in/timabell)

---

From a technical perspective my first-hand experience with Ruby on Rails in a mature project has shown me the that the speed boost of Ruby on Rails over ASP.NET is short-lived and once a project becomes larger and more mature the pace of development appears to my eye to be very similar.

The problems encountered are largely different, but not not biased heavily to one or other stack. For example Rails projects have issues with fragmented and dubiously maintained gems that provide important functionality (not all of them mind; lots are excellent well run projects), whereas Microsoft projects tend to just use whatever Microsoft have supplied warts-and-all; each has pros and cons.

Having learnt all this first-hand I now believe that my initial concern that Rails would take all of Microsoft's market share in web development due to faster (i.e. cheaper) development is unfounded.

I also now understand why the Ruby crowd is so much keener on test-driven development than the C# crowd; it's because they lack all the compile-time checks that catch many classes of programming error up front (e.g. changing a method signature and not updating usages).

The main things I missed when I switched from C# to Ruby were

*   ReSharper:
    *   Find usages / definition.
    *   Refactoring.
    *   A compiler to catch mistakes sooner.
*   Being an expert.
