---
title: Zero-downtime website rewrite migrations
layout: post
reddit: https://www.reddit.com/user/timabell/comments/13or19w/zerodowntime_website_rewrite_migrations/
---

As we know, big-bang rewrites are incredibly dangerous. They are likely to fail or be rejected. For example, the new thing never reaches "feature parity" and gets rejected in favour of the system you were trying to replace.

But how do you practically avoid it? If it's one website on one domain then that seems irreducible. Right?

But there is a way.

## A change looms

You need to change the technology for your website for some reason.

Perhaps your [tech debt](/2020/07/09/approaches-to-refactoring-and-technical-debt/) is out of control and you basically need to do a complete rewrite from scratch, perhaps you've decided to switch technology.

Perhaps you have decided to move everything in your company to a different tech stack.

Either way you are making a BIG change to your technology. Out with the old, in with the new.

### A C# to Rails migration at DfE

I was lucky enough to be involved in a technology shift at the Department for Education (UK) with some exceptionally talented people. I'd been part of a team creating an MVP (Minimal Viable Product) in C# with a couple of web front ends and a postgres database (yay no sql server!). The department then decided to shift wholesale to Ruby on Rails (for good reasons, but they are not important here).

The approach taken was superb, went really well, and is well worth learning from, I'll outline it here for the benefit of all. It was inspired by a [previous rewrite at gov.uk](https://insidegovuk.blog.gov.uk/2016/07/29/the-specialist-publisher-rebuild-behind-the-scenes/) as we were lucky enough to have fabulous people on the team who'd been involved in that.

## How to seamlessly migrate

What's unsurprising here is that you spin up a new web service in your new technology, or with your new way of doing things.

There are two simple key elements that allow a seamless piece-by-piece migration:

1. HTTP redirects in both directions
2. Shared state

These two allow you to build a new service, one tiny piece of functionality at a time, and immediately put them into production, retiring the legacy version of that feature immediately.

## Bi-directional HTTP redirects

It goes as follow:

1. Chose one feature to build in the new technology
2. Spin up the new service on a similar subdomain (e.g. "`www2.example.org`" next to the legacy "`www.example.org`")
3. In the new service, redirect all routes that are not yet implemented to the legacy domain
4. In the legacy service redirect the single route for the chosen feature to the new service.

Now users will seamlessly transition in and out of the new service as they click around the site.

This is genius and I wish I could say I thought of it myself!

Repeat until all desired features are on the new service and the legacy service can be turned off.

## Shared state

It's obviously important that if a user does something on the new system that it is immediately reflected in the state on the legacy system. For us this meant shared access to the postgresql database. The exact method probably isn't that important so long as you can get it to be seamless.

Whatever your state store is, it's important to "freeze" schema changes while you do the transition (within reason) so that you avoid the overhead of updating both system's understanding of the storage schema.

## No more legacy

This will go smoother if you observe the cardinal rule of rewrites: no new functionality can be added to the legacy system. Any changes and fixes must be postponed or made on the new service.

This is to avoid the trap where the old system keeps being improved and the new system can never catch up. It also prevents your time and resources being invested in something that you plan to delete.

> "While it’s tempting to add new features to Specialist Publisher right now, we need to concentrate on rewriting and integrating with the Publishing Platform. ... We don’t want to run two versions of Specialist Publisher concurrently for very long as it risks creating confusion, so we’ll deprioritise product requests until the rebuild is complete."  
>  
> ~ [Jen Allum, Inside GOV.UK, 2016](https://insidegovuk.blog.gov.uk/2016/07/29/the-specialist-publisher-rebuild-behind-the-scenes/#:~:text=while%20it%E2%80%99s%20tempting%20to%20add%20new%20features%20to%20specialist%20publisher%20right%20now%2C%20we%20need%20to%20concentrate%20on%20rewriting%20and%20integrating%20with%20the%20publishing%20platform.%20)

The only exception to this is whatever changes are needed to support the seamless user experience across the two services. Notably the redirections.

## Monitoring

As you migrate your tech, keep an eye on your telemetry, error reporting and anything else you have to make sure your user experience remains good throughout.

## Pattern name: Strangler Fig

This approach is known as the "strangler fig" pattern.

> "An alternative route is to gradually create a new system around the edges of the old, letting it grow slowly over several years until the old system is strangled. Doing this sounds hard, but increasingly I think it's one of those things that isn't tried enough"  
>
> ~ Martin Fowler  
> <https://martinfowler.com/bliki/StranglerFigApplication.html>

See also

- <https://learn.microsoft.com/en-us/azure/architecture/microservices/design/patterns>
- <https://www.freecodecamp.org/news/what-is-the-strangler-pattern-in-software-development/>

## The end

There's not much more to say on this. It's a simple concept that packs a huge punch. If you're thinking of modernising a web stack, or changing tech, I would 100% recommend this approach. The risks of failure are so much lower.

Many thanks to those who I worked with showed the way.
