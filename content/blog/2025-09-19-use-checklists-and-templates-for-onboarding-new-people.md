---
path: /2025/09/19/checklists-for-onboarding-new-people/
title: "Use Checklists & Templates For Onboarding New People"
---

We spend plenty of time as engineers either being onboarded into a new organisation / project or helping onboard others.

The best onboarding experiences I've had have been low-stress, with a clear path to follow, a clear list of things to be done, and many access and setup hurdles magically automated or handled behind the scenes by others - the result is being productive far quicker, and being much less of a burden on others.

The worst have been multiple weeks of sorting through piles of badly written, wrong, outdated/confusing documents, links and instructions trying to work out what I actually need to be productive with little help from others - the result is endless questions to others, feelings of imposter syndrome, doubt and stress all resulting in negative productivity for an extended period of time.

Here's a small but powerful thing you can do to make that journey smoother for those who follow.

I've been on the receiving end of onboarding in places using this approach and it's made a world of difference to my state of mind and productivity; not to mention my opinion of the organisation. First impressions stick.


## 1. Written onboarding guides

First of all, if you have to have someone telling the new starter in-person how to get started because all the knowledge is in people's head then there is huge risk of the information walking out the door with them, and huge opportunities for a more efficient process. I personally love spending time chatting with people, however even I worry about the time-cost of me getting one-to-one hand-holding by someone who clearly already has a ton to do.

So the simplest thing to do is open up a wiki page (confluence perhaps) or google doc and just start writing down all the steps that have to be done. Numbered bullets make for a nice guided flow. Make it easy to read, use proper headings and nice formatting. And lots of numbered bullets.

The best time to capture this is when someone new is onboarding. The person being onboarded and the person helping them know more than anyone else at that point about what's needed. As they find blockers and missing information they should take a moment to capture what they found in the onboarding guide as they go. A quick review from the new starter in the few weeks after they start and have got the hang of things can capture a heap of critical details and ways to handle surprising things, gotchas and blockers.

Include everything you might say to a person - "oh you need to ask xyz, here's there email", or "you need to submit a support ticket in this system [url] to get access to that and then abc has to approve it, here's an example of what to write in the ticket....".

If you can get that done you're ahead of the bottom 30%<sup>†</sup> of teams

<sup>†</sup>*made up number to make a point*


## 2. Checklists

Having got your basic onboarding doc in place, here's a neat trick that I came across somewhere - instead of just numbered bullets, make them clickable checkboxes and tell the new starter to make a copy of the document and work through it ticking things off.

This is a huge stress reducers due to the anxiety caused by worrying about missing steps that have been provided in an unfamiliar environment (combined with the stress of any new role/project), and prevents a lot of wasted time repeatedly reading the list to figure out what's done or managing a separate list.

A lot of software now supports checklists, so whatever you use you can probably add them in.

I know of at least the following that support checkboxes:

- Trello
- Notion
- Slack canvases
- Confluence
- Google docs
- Just about every markdown tool

### Google docs

Just type <kbd>[</kbd>, <kbd>]</kbd> and then <kbd>space</kbd> on a new line and magically get a checkbox that behaves a lot like a bullet.

You can use <kbd>tab</kbd> and <kbd>shift</kbd>+<kbd>tab</kbd> to indent/outdent them too just like bullets.

Or use the menus - "Format > Bullets > Checklist"

![A google doc with a checklist in it](/images/blog/checklists/google-docs-checklist.png)


### Trello

The trello checklist feature is pretty front and center, just create a card and there's a checklist button right there.

![Adding a checklist to a trello card](/images/blog/checklists/trello-checklist.png)


## 3. Templates

If you've already got a rudimentary (or perfect) onboarding doc, and have added some checkboxes, now take it to the next level by making the doc a proper template that new-starters can click a button to get their own copy to tick-off.

This is the icing on the cake for slick onboarding.

### Trello

![Turning a trello card into a template](/images/blog/checklists/trello-make-template.png)

![Making a trello card from a template](/images/blog/checklists/trello-make-from-template.png)

### Google docs

Custom templates in google docs are a bit of a faff and only available for paid g-suite accounts. It's also not clear to me how easy it will be for new-starters to find and use the right template, though they have a "category" system which might help.

It's a bit confusing but you can create and "submit" google docs to become templates, and you can edit the template and the created docs separately.

It has to be allowed in the workspace admin, but that might be the default: [Turn custom Drive templates on or off for users - Google Workspace Admin Help](https://support.google.com/a/answer/3055325?hl=en)

To submit a template - go the usual new doc page, expand out the template list and click the "Submit template" button:

![Submitting a template](/images/blog/checklists/google-submit-template.png)

Choosing a template from the list when creating a new google doc:

![Default template list in new doc page](/images/blog/checklists/google-use-template.png)

... the expanded template list (click the text "Template gallery" with the up/down arrow to the right of it to get to here):

![Viewing template gallery for doc creation](/images/blog/checklists/google-use-template-gallery.png)

Once a document has been submitted as a template, editing the template makes it clear that that's what you are editing:

![](/images/blog/checklists/google-editing-template.png)

[Tips to format & customize documents > Use and create document templates - Google Workspace Learning Center](https://support.google.com/a/users/answer/13003605#create_document_templates&zippy=%2Clearn-how)

## Bonus tips

### 1. Automated setup

Make your git repos require nothing more than a clone and some kind of run script to have a fully functioning local dev setup (there are tons of ways of doing this, bash, docker, makefiles, dotnet-aspire, 12-factor etc. etc.)

Better than a checklist is no need for a checklist at all because there's nothing to do but clone the repo and ship to prod. Having make the list, try and eliminate as much as possible so that the new starter doesn't actually have to do anything. The ninja-level orgs I've joined where you can ship code in your first week (or day?!) work very hard on this level, with every developer tirelessly improving developer setup for code, and behind the scenes [delivery managers](/2019/07/08/why-every-team-needs-a-delivery-manager/) making all the organisational setup seamless and invisible.

### 2. Have an `#new-starters` channel for questions

It's common these days for teams to have slack or some equivalent (for example the universally-hated "Microsoft teams") that support chat-room style channels.

New starters are often hesitant to bother the existing, often busy, team with "newbie" questions.

Create a `#new-starters` channel / chat-room, and ask a few of your existing people who are more enthusiastic about helping new people to lurk in there and keep an eye out for questions. Make sure all new starters are added to that channel and are encouraged to ask all questions no matter how trivial, and let them know that you'll use what's in there to improve onboarding for future people to show that you value the questions beyond just getting them started as an individual.

This has massive benefits:

1. New people will feel much more happy to ask all those "silly questions" that they run in to along the way to being productive instead of holding back or asking the wrong person. (There are no silly questions, there are only onboarding frictions that can be improved).
2. All those normally hidden frictions, confusion and stress can be flushed out into a shared channel where they can be improved upon / eliminated for future new starters.
3. Your existing team can self-select into helping new people get started by joining the onboarding channel.

A win for everyone involved, for so little effort.


## Summary

A slick onboarding process is a never-ending process of constant improvement. Perfect onboarding is an "ideal" that can never be reached but that should be constantly strived for, with everyone encouraged to sand-off any rough edges along the way. It's hard to design onboarding up-front because you just don't know what people will trip over, so the best moment to capture this is the moment when someone is trying to get started, and someone is helping them. Take the time to make permanent improvements that will make each new person find the onboarding experience better and better.

The onboarding experience has, in my experience, been a pretty good indicator of the quality of the team I'm joining. Every team needs great people, and what better way to signal to the best of the best that your places is worth of their time than making every contact with the organisation a pleasure.

Go out and make your next new-starter's experience a great one.
