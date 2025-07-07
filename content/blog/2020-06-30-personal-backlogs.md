+++
title = "Personal backlogs"
+++

## What's wrong with our current backlog / icebucket / todo list?

Do you have a backlog of doom? A bottomless bucket full of probably unimportant things you possibly should do, interspersed with the occasional really import thing that will bite you hard if you don't do it? Do you spend time repeatedly refining the list to make sure you don't miss the important things? Or do you just ignore it and hope luck will save you from the things you let slip?

I've known for a long time that [basecamp promote having no backlog at all](https://basecamp.com/shapeup/2.1-chapter-07#no-backlogs), based on the idea that it takes too much time and anything important will come up again anyway. To some extent I agree, but I have also found serious issues in systems that are perhaps less visible to the naked eye which will for sure have a consequence if not addressed (maybe something that is quietly corrupting data or failing to store it, or maybe a security issue).

## So what should we do instead?

The answer came to me when I read [basecamp's new Shape Up book (summarized here)](/2019/11/26/time-to-shape-up-your-scrum-process-the-new-thing-from-basecamp/) that describes their unique way of working. They don't have a shared backlog, instead they leave it to each person in the organisation to use whatever method they choose to remember what *they* think is important, and then bring that to the table for consideration at the scheduled times that new work is considered.

The full shape-up process is a bit too much of a jump for the teams I usually work on, however I shared the above with a team I worked with, and they took it and came up with an excellent best-of-both-worlds solution. And it's so good I think everyone should use it.

This solution...

* perfectly balances the elimination of a backlog-of-doom nightmare,
* addresses the need to not lose important ideas as team members change,
* and adds the ability to collaborate.
* is ridiculously simple

### Trello

Set it up as follows: Set up a new trello board, name it "shared backlog" or similar, create a list (column) for every team member with their name (and optionally role) as the list title.

![screenshot of shared backlog board in trello](/assets/shared-backlog.png)

Now when anyone thinks of anything that the team should possibly do, they add a card **to their own list** on the shared backlog trello board. It is now clear who owns the idea and is responsible for campaigning to get it prioritized.

In preparation for the next planning session each person organises their own list so that the things they think are most important are on the top.

On a regular basis, (say fortnightly during a sprint planning session or similar), the team goes through the board, and each person talks about their top one or two cards to say why they think it should be included in the sprint. The cards that are chosen by the team get added to the sprint to be done as part of the normal work for the team, thus making sure they actually happen.

Simple eh?

Here's an example board <https://trello.com/b/cxRXPgcb/personal-backlogs-example>, you can use it as a template if you wish.

### Jira

If you're using Jira you can achieve the same effect by abusing the "sprint" feature. Just create some extra sprints with the "Create spring" button and instead of calling them "sprint 25" etc, call them "Tech backlog", "Design Backlog", "Customer Service Backlog" etc. Then you can nicely group each role's needs and they can manage their own priorities within their own backlog. The actual "backlog" in Jira can now be just for true user stories / product features.

![screenshot of using sprints as personal backlogs in Jira](/assets/jira-personal-backlogs.png)

### Useful?

[Let me know](/contact) if you use this approach and if it works for you or not.

## What about normal feature development?

You could theoretically have the product owner manage all the forthcoming product features in their column. I think it is better for them to continue to manage the product's feature backlog in the existing jira/trello/github project system, which will now be beautifully free from tech debt, random ideas and other clutter. This is what we did and it worked great.

## Bonus ideas

* Add a label "next sprint", and get people to tag the cards they think should happen next.
* Technical debt often ends up here, read this <http://laughingmeme.org/2016/01/10/towards-an-understanding-of-technical-debt/> to be able to talk more coherently about this topic.
* Turn on voting in trello and vote on each other's cards.

## Did it work for you?

This setup worked superbly for us as a team and I'd recommend it to anyone who'll listen.

We no longer have the overhead of a product owner losing the will to live trying to understand cryptic tech debt cards left by a previous developer, wondering if they were trivial or pending catastrophes.

When someone leaves, the new person or others on the team can look over their cards and decide what to move into their own column.

## Also available on the podcast

If you like this, you might want to have a listen to me and David talking about this and other lessons learned in [episode 8 of software should be free - Hiding from Covid-19 and the end of 2 years at DfE](https://pod.timwise.co.uk/8).
