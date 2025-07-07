---
title: Taking an idea from business concept to software implementation
layout: post
---

This post is my explanation of a concept I got from someone far more intelligent than me, and I've written it here in my own words as much to see if I can understand, explain and refine it as to share it with you lovely people. When one person teaches two people learn, as they say.

## Context

Sometimes you are taking instructions from someone who deeply understands technology and how to design and iterate delivery of software systems. This blog post is **not** about that situation.

This post is for when the people with the business knowledge don't know how to run digital projects themselves, and that's why you're here.

It's also **not** a post about an individual technologist doing the whole thing, listening to the business and then building what they need; in that case you need far less formal process.

This approach is for software engineering **teams**, which means the business knowledge has to be transferred effectively into many heads. System design and implementation is in this case a collaborative engineering effort.

## Method

1. Business folks ensure they have an idea of what their needs are, the relevant context and are ready to explain and document it for engineering teams.
1. Run a workshop where "the business" shares with the delivery team the business requirements they have gathered in their preparation for the work plus the context for the needs (i.e. the "why").
    1. The goal is to create a common understanding of what the business needs without getting into technical design or product increments / stories / tasks.
    1. The outputs of this exercise should be living documents that can be referred to and refined as project delivery continues and understanding evolves.
    1. This is a collaborative exercise, with the engineering delivery team actively probing and challenging and the shared artifacts being refined with the new understanding.
    1. Don't forget "unhappy" paths as well has the more obvious "happy" paths, plus non-functionals like capacity, latency, cost, design, UX etc.
    1. Explanatory diagrams, journey maps and data journey maps are preferrable to bullet lists and prose as they encourage the right level of detail and help avoid solutionizing.
    1. Check out [Miro](https://miro.com/) & [Lucidchart](https://www.lucidchart.com/) to assist with sharing this understanding, as well as whiteboards, Post-its, index cards etc.
1. Run a technical design session with the technical team to plan out the design of the system and a route to delivery at a high level. The business do not need to be present but may need to be consulted for clarifications of the above business needs.
1. Present the design back to the business to flush out any issues and further refine understanding of the business needs. Iterate as necessary.
1. Produce user stories that represent independently deliverable capabilities. (Only as much as you need right now for planning and delivery, let's not turn this in to waterfall!) ... With these user stories you can then:
    1. Estimate the delivery effort required (complexity, t-shirt sizes, story points etc)
    1. Prioritise them based on estimated cost versus value delivered.
    1. Prioritise things by the risk involved (e.g. "this is completely unknown so let's spike this first to reduce delivery risk")
    1. Figure out what depends on what and order delivery based on that.
    1. Decide what should be delivered versus what should be dropped. (A [Product Owner](https://timwise.co.uk/2019/07/08/why-every-team-needs-a-delivery-manager/#aside-product-who) decision)
1. Only once this shared understanding of the business needs and context plus system design is in place do we proceed to delivery of the user stories in whatever way the engineering team sees fit. Presumably some kind of agile/scrum/xp kind of thing.
