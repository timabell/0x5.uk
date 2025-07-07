+++
title = "Trunk based (mainline) development is (mostly) wrong"
+++

## Mainlining

Some very experienced developers, some of whom I've heard it from in-person, strongly advocate what is often called "mainline" or "trunk-based" development, meaning that the git history is a series of commits directly to the main branch, with no pull requests, feature branches or merge commits in sight. This is often held up as the panacea for achieving fast, high-quality delivery.

Note that there is a bit of a terminology problem, and I am not talking about what is described at [trunkbaseddevelopment.com](https://trunkbaseddevelopment.com/) which I actually agree with and think is excellent.

The absolute rule I've heard touted more than once of "no merge commits on main" (aka straight-line history), sometimes enforced by github configuration, is absolute balderdash. This assertion is typical of the black-and-white presentations of topics that seem oh-so-appealing when presented in the conference talk circuit where there is no room for nuance and actual trade-offs made in the trenches, and where big extreme statements win the game of attention.

There is a place for thoughtful, individual mainline commits, so don't take this as saying the opposite extreme of "only merge commits / PRs on main". A small-to-medium internally consistent patch (say 1 to 200 lines of diff at most), can be quite a reasonable thing to just push to main.

## Does pairing remove the need for PRs?

For anything more than trivial changes in your production code and test code you probably want two pairs of eyes on it, and pairing is a great way to achieve that in real-time. But does pairing remove the need for a PR entirely? Some say yes, but I say it depends on the actual patch ...

The question of pairing and the question of "mainline vs pull request" are almost entirely orthogonal. Pairing fixes the async-review problem, and certainly reduces the need for PRs to achieve peer-review, but that doesn't mean we should reflexively throw out feature branches, merge commits and PRs with the proverbial bath water.

## Why branches and merge-commits matter

Unconditionally mainlining everything loses some important capabilities:

- The ability to group a series of related commits (e.g. reformat, refactor, add feature), into one coherent group by way of merging them to main in one hit. (With or without github and its PRs.) A future reader can use this to look at history at two levels of detail - using `git log --first-parent` to look first at the merges and commits to main, and then *only if it's interesting* look at the series of patches in a feature branch that was merged in. And conversely it allows breaking down a patch that needs to go into main in one hit (to avoid breaking things by shipping half-finished work) into a series of easier to understand patches with meaningful commit messages.
- The ability to check your changes with CI in github before merging to main to be sure you don't break main for everyone else (plus the permanent record of another "Fix main build, oopsie" commit).
- The ability to offload regression checks to github actions instead of having to always run all the tests locally.
- The ability to create a series of commits, discover they are wrong several hours later, and throw them out or rewrite them before they ever hit main.

If you think mainlining generates a clean history, how often have you made a series of commits before realising that the shape of code isn't right and now you have another series of commits to get it into a different shape. With mainline development that completely irrelevant first attempt is now in history to confuse future readers for ever more. With branch based development you can throw it out and pretend it never happened.

## When to mainline, branch or PR

It's a bit of an art, so here's some rules of thumb to guide you through the mainline / branch / PR decisions as you write code:

1. Pair on everything you can, eliminating the need for a PR for peer-review. Only peel off to solo work when it's painfully obvious that there's zero value / knowledge-transfer / alignment to be gained by pairing (e.g. library upgrades).
2. Trivial, uncontroversial changes can be mainlined solo (if your org allows any solo pushes to main), especially if you run the tests locally before pushing. Watch out for linters and formatters in CI. Pre-commit / pre-push checks can help you avoid breaking the build with silly mistakes.
3. Slightly bigger changes can be pushed directly to main if you are pairing, but they should still be restricted to smaller, simple to understand patches; not entire large features.
4. When working on a larger feature, try and peel off as many unrelated pieces as you can and mainline or PR them separately as you go instead of lumping them in to your feature patch/branch, rebasing your feature patch/branch onto the updated main.
5. If a piece of work requires a few logically coherent steps to make the change, that are related or build on each other, then group them together in a feature branch. If you are pairing then you can run your tests & lint locally, create a merge commit on main that merges your branch in, and push that to main. No PR needed as it's already been reviewed.
6. You may opt to open a PR in any of the above circumstances anyway in order to:
   1. Get a run of CI
   2. Get some async input from the broader dev team or across team boundaries.
   3. To put a novel idea/technique into public and give it time to be considered by yourself and others. The draft PR feature of github can be useful for this. Also useful for "spikes" (experiments in code to learn something or try something out that aren't necessarily production quality or ready to merge).
7. Beware of long running branches with many commits, even if they are lots of well crafted commits. It's a sign your deliverable increment is too large (at feature branch and/or story level), and you should look to take a step back and break it down into smaller increments; maybe even ditching the branch and starting again from main.

Note that you need to be constantly considering these rules of thumb as you make every change to the code because in the fluid development flow it's normal to range across all sorts of types of changes in one coding session (e.g. cleanup, refactoring, bug fixes, feature changes, quality improvements, ci fixes, editor config changes, massive file/folder renames, and the actual features, etc etc), and each of these might require a separate approach to generating a high-quality history.

## Split up commits *before* you write more code

Flipping to main and making a separate commit when you realise you want/need a change that is unrelated to your feature branch is a great habit/skill to build. It does however take discipline and practice.

I see many developers who default to branch-based development and just pile any old thing they need into their current branch, ending up with mammoth PRs that change far too much in one go. They often then complain that splitting it back up is too hard so they should just squash it. As the old saying goes "if I wanted to get to there I wouldn't have started from here"; it's far better to split into commits as you go rather than struggling with git's tricky-but-powerful `git rebase --interactive`.

I've had devs say to me that "it's not worth the time" to create a series of atomic coherent and well described commits. And for evidence they often point to their massive commit that does too many things, or their pile of incoherent "wip" commits to a branch, combined with the effort it takes to split and recombine commits into something better. In commercial projects I often relent because at that point the horse has bolted, and they are right that it isn't worth spending that much client/employer time rescuing their history aside from the opportunity to demonstrate rebase-interactive to them. (Besides, it's their name on that commit forever, not mine). That doesn't however make it good enough, or the correct conclusion. The correct answer is that you should work on getting the series of patches right as you go, and the cost of interactive rebases largely goes away.

## Feature flags DO NOT replace feature branches

Some claim that feature flags (the ability to toggle capabilities on and off at runtime) are the reason you no longer need branches.

To be sure, they are a useful thing, and an answer to long-lived feature branches that can't be merged because the feature isn't ready to ship yet.

But just because you know how to use feature flags, still doesn't mean you should throw out the richness and tools available to you with merge commits to main and PRs. The fact that some teams have painted themselves into a corner of PR-hell doesn't mean you should throw out PRs entirely. You can have feature flags *and* the option to use branches, merge commits and PRs when it is the right tool for the job.

## "But no-one cares about the history"

Someone said this to me today. They aren't the first person to say it to me either. This is empirically wrong. A friend of mine calls people with this mindset pejoratively "BSBITS devs - Big Save Button In The Sky Developers" meaning that they think that the only thing that matters is the current production code, and that source control is a fancy save/share system.

Here are some of the ways that I have seen first-hand many many developers including myself "care" about history:

- Understanding why the current code is how it is in order to know how/whether to change it.
- Understanding the changes another developer made in order to replicate those changes in a different microservice in a different team.
- Reviewing a large PR with 1000+ lines of code changed, where some of it is refactoring and reformatting and some is functional changes - looking at the commits of the PR/branch allows you to see the intended functional change (sometimes just a few lines) separately from large rote refactors etc.
- To judge the capabilities and productivity of a developer with a view to hiring/firing. Yes this actually happens, I've seen it. And guess what, that developer doesn't get to explain their poor quality history, **and they can be judged harshly for it**. Are you really sure no-one cares?
- To get a feel for the capabilities of a co-worker.
- To keep up to date with changes to a project that you are either involved in directly or indirectly, perhaps a repo belonging to another team.
- Principle developers that operate cross-team looking for best/worst practices that they need to take action on. (They often have significant HR influence, do you want them judging your poor history badly because "no-one cares"?

Ironically I've even seen some of the people who've said to me "no-one cares about history" then go on at a later date to look at the git history in order to figure something out while I'm on a screenshare with them. It's all I can do not to point out the hypocrisy.

## Build that habit

In the end, a lot of the arguments I see come from people who haven't mastered the skill of creating high-quality history with commits, branches and thoughtful merges.

The answer in my eyes is not to declare half of the tooling we have off-limits, and to claim that the generated history is unimportant, it is instead to get really good at creating good history as you go so that it become effortless.

Treat generation of history just like generation of code. It's the most visible and permanent record of what you do as a developer of software, and you should treat it with the same pride and diligence as you do the code that runs in production.

## Fin

Coding is not just computers running things, it's inter-person communications. Quality history, and the richness that branches and merges give us is part of that tapestry of communication with persons past, present and future.

Become good at it and the objections melt away.

## Further reading

* For a balanced view of PRs and related topics have a read of ["Pull Request Theatre" by Chris Bimson](https://christopher-bimson.github.io/2024/07/pull-request-theatre/)
