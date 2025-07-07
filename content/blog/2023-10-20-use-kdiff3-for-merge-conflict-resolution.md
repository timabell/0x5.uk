---
title: Use kdiff3 for merge conflict resolution
layout: post
---

I agree with Dermon: ["You should be doing 3-way merges"](https://medium.com/@damon.lundin/you-should-be-using-3-way-merging-4824400bae7).

I also see most developers I work with (that's a lot as a contractor over the years) don't even know what a 3-way merge is, let alone have it correctly configured and are using it.

## What is a 3-way diff (it's not what you think)

A 3-way merge is ***not*** that 3-pane view you get in some diff viewers which has:

1. yours
2. theirs
3. result

That's a two way diff, we're not counting the *output* here.

A proper 3-way diff is:

1. before anyone changed it (base)
2. yours
3. theirs
4. result

(still not counting the output)

Here's what a full 3-way diff looks like in kdiff:

[![kdiff 3-way merge screenshot](/images/blog/git-kdiff-3way-merge.png)](/images/blog/git-kdiff-3way-merge.png)

For proper terminology see [git - what do 'base' 'local' 'remote' mean?](/2023/10/20/git-what-do-'base'-'local'-'remote'-mean/).

## Why as a developer you MUST set up 3-way diffs

"Who cares", you say. In fact I've heard devs say it.

And those devs that say this, I then see doing two things:

- Manually trawling through conflicts that kdiff could resolve correctly instantly
- Actually getting merges wrong because they chose the wrong things *when the tool could algorithmically get it right*.

If you think about it, given only the information of "more lines this side than that", how can you know whether they were added in one or removed in the other? You have to rely on additional context (such as a hunch for what the other devs might be up to). But if you add the missing 3rd piece of information, which git already has, "what did it look like before anyone changed it" (aka "base"), then you and the algorithm can both nail it.

With the full 3-way merge all you are left with is genuine conflicts to deal with (they changed the same line as you, damnnnn).

You even find kdiff immediately exit because it has a "better" merge algorithm than git (or at least less conservative), allowing it to instantly resolve many conflicts.


## Why use kdiff3 and not [tool of choice]

### Killer algorithm

I've (repeatedly) looked for better tools than kdiff3. It has a 20 year old not entirely intuitive user interface. But it has one *killer* feature: it has by far the best merge conflict resolution algorithm out there.

If someone could create a merge tool that can do merges like kdiff3 but with nicer UX and I'd jump (well, and open source of course), but nothing holds a candle to this algorithm.

### Open source

You have 3 choices:

- Commercial software
- Freeware
- Open source

I will always prefer open source by default because it just tends to stick around and not change all the time on you. KDiff3 is an excellent example of this, it does a job well, and is still available and basically unchanged in 20 years. Freeware cannot be taken over by a new maintainer, and has no funding so in the end is often short lived. Commercial software often doesn't last, or is changed to something you didn't want in the end. There are few companies that have provided stable software over 5+ years.

### Hidden features

It's really not that easy to use, but learn how to use the following and you can get very quick and accurate:

- keyboard shortcuts for jumping around conflicts and choosing which side to pick
- configure "escape" key to exit (under integrations for some reason)
- manual diff alignment - select a line, hit ctrl-y, repeat for other diffs (zero ui feedback), when you do the second and third you'll see the diff jump, and often immediately figure out a conflict it hadn't understood before
- character-level diff highlighting (highlights bits of a line that are different)

## Missing features

- Good UX
- Syntax highlighting
- Native chrome (i.e. look like an app from your operating system)
- Good UX

## You're doing it wrong

- If you *ever* edit those `>>>>>>  <<<<` conflict markers you are just editing git's non-attempt at merging the files. You're doing it wrong, get a real tool (kdiff).
- If you use your IDE's built in merge conflict tooling, they are universally only 2-way at best, and not very good at that. You're doing it wrong, get a real tool and learn to use it (kdiff).

## Configuring kdiff3

One from the archives - [configuring kdiff3 as a mergetool](/2010/09/03/configuring-kdiff3-as-mergetool-in/) - I still have to do this occasionally on windows, though git has better defaults now so might just work if you pick kdiff3 as a difftool without the detailed config.

## Finding other tools

There aren't any open source tools as good as kdiff. I wish they were.

- <https://alternativeto.net/feature/3-way-merge/>

Prove me wrong and I'll either thank you or find you a harder conflict to solve.

If you don't mind paying for a commercial tool, [Beyond Compare](https://www.scootersoftware.com/) is actually even better at 3-way merges than kdiff, and has a marginally better UI. It's been around a long time.

Other tools that have 3-way merge capabilities to look at are:

- [Perforce's p4merge](https://www.perforce.com/products/helix-core-apps/merge-diff-tool-p4merge) (Proprietary freeware)
- [Araxis merge](https://www.araxis.com/merge/index.en) (Paid)

## Dangerous hidden changes

It's also worth noting that merge commits are the *least* well reviewed commits. I think a lot of devs don't even realise that they can contain anything you like, not just what was in the two source branches. Combine that with bad tooling and it's a [recipe for disaster](https://web.archive.org/web/20140225140816/https://nakedsecurity.sophos.com/2014/02/24/anatomy-of-a-goto-fail-apples-ssl-bug-explained-plus-an-unofficial-patch/).
