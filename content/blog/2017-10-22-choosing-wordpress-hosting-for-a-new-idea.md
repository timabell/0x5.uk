---
layout: post
title: Choosing wordpress hosting for a new idea
date: 2017-10-22 11:32:08.000000000 +01:00
type: post
permalink: "/2017/10/22/choosing-wordpress-hosting-for-a-new-idea/"
---
I need somewhere to keep the marketing site/content for my new [Sql Data Viewer](https://sqldataviewer.com/) product. (Since renamed to [SQL Schema Explorer](https://timabell.github.io/schema-explorer/).

I could use [github pages](https://pages.github.com/) or something similar, but I've found the overhead of needing a dev environment to make any change puts me off getting things done. I've been using wordpress.com for this blog and am pretty happy, especially having a mobile app. I've also heard using wordpress makes it easier to outsource content/design if you have enough success to make that worthwhile.

I don't fancy maintenance, security patching and backup, so the marketing site is currently on **[wordpress.com](https://wordpress.com/)** where I've paid for the "personal" plan at **£3/month** to remove ads and the **£0.92/month** for mapping a domain. Affordable for contactor running a shot-in-the-dark startup side-project that may never make a penny. Note that you only get their built in analytics, you can't add google analytics, and you can't install plugins on that plan.

* To get google analytics you need "premium" at £7/month
* To be able to add plugins you need "business" at £20/month

This is on top of the **£1.15/month** for domain registration and **£10/month** for a VPS (virtual private server) to run my demo site from, both from the excellent [bytemark](https://www.bytemark.co.uk/) hosting company, who've been fab on support from day one.

Just for completeness: the demo site connects to sql azure instances are easily within the $40/month included with my MSDN Professional subscription that I use for contracting. Handy.

I've been listening to lots of startup podcasts ([email me](mailto:tim@timwise.co.uk?subject=startup-podcasts&body=send-me-your-opml!) if you want the list), and have discovered the mighty [Justin Jackson](https://justinjackson.ca/) and his excellent [Marketing for Developers](https://devmarketing.xyz/) content - I recommend you buy it if you're a developer thinking of selling a product / service. I'm now working through trying to apply the lessons in the book to my own product. I got to the analytics bit and hit a wall. Wordpress.com (the wordpress hosting site, not the software itself) force you to upgrade to the business plan at **£20.83/month**. Given I don't know how long this is going to take me I'm not keen to start ramping up costs to that extent with no obvious route to a return on the investment.

I've looked at the three recommended in Justin's book (plus more added more recently), and the starting prices are:

* [Siteground](https://www.siteground.co.uk/wordpress-hosting.htm): Startup plan (like it!) **£2.75/month** - looks like this might be a winner then! Oh wait, that's a sign-up discount, it's actually **£6.95/month**. Hrumph.
* [Krystal](https://krystal.uk/wordpress-hosting): Personal **£18/month**
* [WPEngine](https://wpengine.com/plans/): Personal $29/month - about **£22/month**.
* [Pagely](https://pagely.com/plans-pricing/): VPS-1 $499/month - about **£380/month** - ouch! I don't think I'm their target market. I wonder if they repriced, perhaps Justin should drop this one from the book.

And that's where I'm at right now. Maybe I'll just shove a docker wordpress image on the VPS, it's already a docker host. I need to figure out hosting multiple sites on one IP for the demos anyway. But then again, I don't want to be a wordpress sys-admin. Or maybe I'll rethink the static site thing.
