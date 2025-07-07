---
layout: post
title: Yet another good-commit-messages post
date: '2016-03-18T15:25:00.000Z'
blogger_orig_url: https://timwise.blogspot.com/2016/03/yet-another-good-commit-messages-post.html
---

## Why you should care about writing good commit messages

1.  It is extremely likely you won't be the last person to touch this code.
1.  You will forget the details of exactly why you did something after a few weeks/months/years. Be kind to your future self.
1.  Source control systems out-last [access to] ticket trackers by many years (Jira, Github-projects, Trello boards, etc. etc., how many have you seen in your time working on code? A lot more than you've seen source control systems I'll wager.) A link to a ticket is not enough. Copy the relevant context from the ticket into the commit message.
1.  Not everything can be deduced from the code. Even with excellent variable/function/class/module names, and beautiful refactoring, the circumstances that let to a particular design or change are lost. Good comments adding context help, but sometimes you don't want to clutter code with temporally relevant comments; the source control gives you a suitable place to keep this information locked up with your patch of the day.
1.  When someone wants to know if they can delete a line of code in the future, if they can't fathom why it was put there then the only way to find out is to delete it and see what breaks. By adding context in a commit message they can use the source-control history to get that context, and then decide whether that context is still applicable.
1. You might think your code is perfect and correct and needs no explanation beyond the code itself; but what if there's a bug? Now the only documentation is the buggy code. If I come to fix your code later how do I know what it was supposed to do without going back to first principles. What algorithm or design pattern were you trying to implement? What references did you use?
1. [Chesterton's Fence](https://thoughtbot.com/blog/chestertons-fence) - understand why something is the way it is before you change it.
1. And finally, I have seen *first hand* developers being **judged in their absence**, on the quality of their git logs. For example when deciding whether to let someone go who is considered sub-standard for the team, the principal engineer and an engineering manager might go over the individual's output in private, without that individual present, to collect some evidence and inform their final decision. Do you want that to be you? Honestly, that "wip" commit with your name & email on it that seemed so harmless at the time doesn't look so good now it's out of context of whatever rush / justification there seemed to be in the moment. Worse still if you make a regular habit of lazy / rushed / incoherent commits.

> "Write every commit message like the next person who reads it is an axe-wielding maniac who knows where you live" ~ unknown

## Why the business owner cares about good commit messages

(Even if they don't know it)

Developers writing high-quality commit and pull request (PR) messages provides clear context and explains the "why" behind changes, directly impacting the clarity and long-term value of the codebase as an asset.

Well-crafted messages ensure that future developers, including new hires, can quickly understand the rationale behind decisions, saving time, reducing the cost of onboarding and reducing the risk of misinterpretations that could lead to costly errors.

They support smoother collaboration across teams, foster accountability, and create a historical record that aids in audits, troubleshooting, and strategic decision-making.

This practice minimizes the risk of long-term inefficiencies, speeds up development, and ensures technical work aligns with broader business objectives.

## Why I care about good commit messages

For reasons of chance I've ended up more than once maintaining and extending things created by other people, many of whom had moved on from the projects and were no longer contactable.

When dealing with a piece of code that has a behaviour that is clearly causing problems for users/customers etc. sometimes I have needed to understand *why* it was that way before I could know whether it could be changed without creating even bigger problems.

Another example was a buggy and complex algorithm implementation, but no clue left as to what the algorithm being implemented was, as a result a week of reverse-engineering the maths happened that could have been saved with a simple "this is an implementation of ..." with a hyperlink or algorithm name.

With the author of the code not available to ask I'm left only with the source code and `git blame` to fathom why it's like that.

When you find the commit that added the patch and it's one of the following then you realise the author was not taking into account future maintainers:

- "wip"
- an entire fully formed set of behaviour appears in one giant commit with no explanation (perhaps copied from somewhere else)
- a mention of a ticket number from a defunct ticket tracker with no further explanation

It seems to me that it doesn't take much additional effort to rattle out a sentence or two with some context on why something is being changed for the benefit of future maintainers. Especially when it's a complex patch that maybe took more than a day to create.

Given that each line of code is read many more times than it is written it seems that being "lazy" with explanation is not delivering the highest quality output to your client/employer/project.

I, like many developers, also value speed of delivery, fast iteration, early prototypes that may get rewritten; but you can still move fast while taking a few minutes for each patch to explain it. And you have to think that just because you might throw this one away, you also might not, and you just don't know yet.

## How to make them better

There's not much for me to add on what's already been written, so read these articles on the specifics of writing good commit messages.

* [Use the present-tense imperative](https://stackoverflow.com/questions/3580013/should-i-use-past-or-present-tense-in-git-commit-messages/3580764#3580764) ("Add …" not "Adds" or "Added")
* <https://vip.wordpress.com/documentation/commit-messages/>
* <https://robots.thoughtbot.com/5-useful-tips-for-a-better-commit-message>
* <http://chris.beams.io/posts/git-commit/>
* <https://gds-way.cloudapps.digital/standards/git.html>
* <https://mislav.net/2014/02/hidden-documentation/>
* [Pull Request Etiquette gist by mikepea](https://gist.github.com/mikepea/863f63d6e37281e329f8) - covers pull request quality as well as individual commits

My personal additions to this list:

* A list of highlights of changes in bullets is often nice to add, think of it as a tourist's guide to your patch. It makes it easier to spot the key changes in a large diff, and can make code-reviews more effective.
* Hard-wrapping lines shouldn't be required, that should be an editor/display concern but unfortunately the git tooling doesn't agree so doesn't wrap anything so you might have to hard-wrap.

## Are you expecting every tiny change to be like this?

No. Some patches really don't need much explaining, e.g. re-applying default code formatting or fixing a typo; but you should always consider what context a future reader might need.

## Are your patches atomic incremental improvements

If it's hard to write a good message, it might be that you are not taking the time to craft good single-purpose commits.

## Examples of good

* <https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f076ef44a44d02ed91543f820c14c2c7dff53716> ([via reddit](https://www.reddit.com/r/linux/comments/3y6st0/funny_commit_message_in_kernel/)) - what I like about this one is:
  * It adds **context** that you could never get from code (note some is repeatedly more briefly in code comments which is a good thing)
  * It explains the new behaviour **in human terms**.
  * It's easy to read (good quality English prose)
* <https://github.com/DFE-Digital/find-teacher-training/pull/159/commits/00e24dbc216836dd73281688491b8da355706d81> - what I like about this one is:
  * It's part of a PR that is also well described & reviewed
  * It adds context (about the thing that will call the endpoint added in the patch, i.e .the reason it was created)
  * It mentions a PR in another repo that was a source for some of the code & ideas, yet more context for answering the question "why was this done and why is it like this?"
  * The co-author is attributed (github shows this which is nice), this might give you someone to talk to about if they're still around
  * It provides an outline of the patch so you don't have to parse the whole diff to get a flavour of how the patch changes behaviour. When you have a lot of patches to read because you're looking for something in the history this can be a big timesaver.
  * It gives insight into why certain decisions were made about the final shape of the patch (e.g. why just /healthcheck and not /ping as well)

## Video presentations on why good history matters

Remember, your code and your commits can last a veeeeeery long time and you never know what poor soul will have to understand what you did and why years later... when you have time watch this video:

<iframe width="560" height="315" src="https://www.youtube.com/embed/1NoNTqank_U" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/G45hqWNScvE" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Adding ADRs

Documenting broader reasons can be done with [ADR](https://github.com/npryce/adr-tools/tree/master?tab=readme-ov-file)s (Architecture Decision Records, i.e. why we did this and not that), [Y-ADRs](https://medium.com/olzzio/y-statements-10eb07b5a177) (basically highly condensed one-liner ADRs), readme files etc., ideally in [ascii](https://timwise.co.uk/2023/06/01/text-based-tools-the-ultimate-format-for-everything/), and even more ideally in the same commit so that a `git blame` will lead the future reader to find the additional reasoning right there in the same patch as the change to the code.

## Learning more about git

- [NDC Talk: "git beyond pull & push" - Jørgen Kvalsvik - NDC TechTown 2023](https://www.youtube.com/watch?v=nr0u3R3kVrI)
