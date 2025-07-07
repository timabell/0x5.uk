---
layout: post
title: Down with SDV! long live SSE!
date: 2017-12-29 02:59:54.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
author:
  login: timabell
  email: tim@timwise.co.uk
  display_name: timabell
  first_name: ''
  last_name: ''
permalink: "/2017/12/29/down-with-sdv-long-live-sse/"
---
I can't keep up with myself on this startup journey, but I hope I can give you a peek into my journey as I go. I've had couple of revelations recently which I'll explain here:

## Discovering your needs

I've managed to talk to more people about what problems I could solve and have started to learn more about what value this tool might provide (solution-to-problem instead of the usual solution-looking-for-problem).

I had originally thought of this tool as something for viewing data, but I've had several people express an interest in the ability to visualize relationships. This was surprising to me as personally I've been using [SqlHawk](http://timabell.github.io/sqlHawk/) (my fork of [SchemaSpy](http://schemaspy.org/)) to get to grips with database relationships, but I hadn't considered that they don't get widespread use in the circles I move in; presumably due to a mix of awareness and what a pain they are to set up (Java, shudder).

Having explained my vision for the tool to my friend and ex-colleague Ben, I managed to ask him to say in his own words how he might hypothetically describe it to others, and he uttered the magical words: "well it's kind of a schema explorer". And suddenly I understood that the real value of the tool I'm creating is not in the ability to poke around the data per-se, it's actually the ability to come to an unfamiliar relational database and be able to much more quickly understand how it hangs together. (It'll have value in familiar databases too, but I like this focus, it feels higher-value.)

As a result "diagrams" is now the top-priority feature being added to SDV.

It also gives me a new name for Sql Data Viewer...

<div class="flickr-pic">
<a data-flickr-embed="true"  href="https://www.flickr.com/photos/tim_abell/24405997637/" title="IMG_20171219_160643"><img src="https://live.staticflickr.com/4731/24405997637_bda2d45a93.jpg" width="500" height="276" alt="IMG_20171219_160643"></a>
</div>

## New name, new domain

The product has been renamed to **Sql Schema Explorer**, which can now be found on the shiny new domain [schemaexplorer.io](http://schemaexplorer.io)

For the new website:

*   I've given up on all the [fancy wordpress designs and hosting](http://blog.timwise.co.uk/2017/10/22/choosing-wordpress-hosting-for-a-new-idea/) I was using for the old domain and have gone for [github pages](https://pages.github.com/).
*   All the bloated css and javascript is gone, leaving nothing but a [hand-crafted flat html](https://github.com/timabell/sdv-website/blob/master/index.html) file that should load beautifully on any connection thanks to being under 1kb of content in total with no trackers or external resources.
*   It should reliably render on most devices with minimal CPU load or delay thanks to the lack of bloated and fragile javascript / device detection etc.
*   I've ditched the fancy drip sign-up form in favour of a simple email link (why solve the volume problem when I don't have it yet?).
*   I've ditched the google analytics tracker because it's a vanity metric if it's not money in the bank; and these trackers have hidden costs (page load time, leaking your customer's data to google etc). If I get a sudden influx I can just ask them how they found me rather than reading between the digital lines.
*   I've stripped the content back to almost the bare minimum to try and drive focus towards email signups so that I can then engage in-depth through that. I need enough that I can point people at it in conversation to get them signed up. I only need a dozen early customers to help me shape the product so I don't need to optimize for complete strangers who've never heard of me yet.
*   I've created my own personal style of  design that favours minimalistic css and markup to keep page load fast and complexity down whilst still giving structure to the message and a little bit of easiness on the eye (e.g. off-white/black, read the css if you like). I'll be continuing to [improve my design skills](https://designacademy.io/) as I work on this project, though I'm not against outsourcing when I need to.

## Money, money, money

You may remember I wrote about [making SDV free](http://blog.timwise.co.uk/2017/11/17/why-sdv-could-be-a-billion-dollar-business/) not too long ago. With the above new understanding about the value that the product can provide and what it will take to build a full-featured product for that market I am no longer concerned about being immediately copied, and think it has sufficient value to be a viable product in its own right. As such I will be charging for it after all.

I'll be following the great advice from the episode of [Startup Chat - 268: Encore Episode – How to Get Your First 10 Customers](https://thestartupchat.com/ep268/) that I heard recently (highly recommend this if you're also thinking of getting a startup / side-project off the ground).

The starting price point will be £150 per single user/machine. This is based on the "3x the first number you think of" formula because I think  they are right that first instinct is off; after-all I have to make this a viable business otherwise development will stop and no-one wins.

I'll be offering the recommended money-back guarantee for my first customers; that way I can prove that there is real value in what I'm creating whilst maintaining my high ethical standards for fairness in business.

## Still here?

Great! Thanks so much for reading this. If you're interested in keeping up to date or being involved in the early life of this new product then head over to [schemaexplorer.io](http://schemaexplorer.io) and sign up!
