---
title: "Viewing git history for merged feature branches"
layout: post
---

I've been using git for nearly two decades now and yet I still seem to find new challenges and new things to learn on a regular basis.

One of things that makes me scratch my head more than I would like, is when an inexperienced developer creates "interesting" history in git because they don't know how to use the tool in a way that creates easy to understand history for fellow developers.

## The git jungle

One of the curious properties of git (and I guess computer code too) is that the more experienced developers create output which is *easier* to understand, and the less experienced developers create output which is *harder* to follow. With git logs, it goes to the point where an inexperienced developer using git can do some things that will completely stump even highly experienced developers for a good amount of time before understanding what they are looking at, and perhaps how it got into that state (I quite often never find out what they did that resulted in their unique flavour of mess).

![AI generated image of an intrepid developer with a machete hacking through a jungle of git commit logs](/assets/dall-e-git-log-exploration.webp)

## "First parent"

One of the best tools I've found for simplifying a complex history that I use all the time is the `--first-parent` filter. This alone is worth a blog post as far fewer people than I would expect know about this, even though there's options for this in many of the graphical git viewers now.

As I mentioned in [my post about avoiding squash-merges](/2021/03/15/github-rebase-and-squash-considered-harmful/) the ability to view the history of `origin/main` with or without the full history of every feature branch that was merged in is immensely helpful. Especially if the feature branches that have been contributed are of varying quality, for example being based on extremely old commits, having repeated unecessary merges *from* main before being merged in, or just being a jumbled pile of "wip" and other assorted unstructured commit noise.

## Anecdote

As a bit of an entertaining aside to this story, one of the most puzzling things I tripped over in a git log was something that completely destroyed the history produced by `--first-parent` resulting in no small amount of confusion. For a moment I thought a whole bunch of junk commits had been pushed straight to `main` bypassing the pull request and review process. After much studying of the logs and trying different tools to view the git logs I eventually figured out that the merge commit that pulled the feature branch into `main` had the "parent" commit sha1's listed in the wrong order; so the previous commit on the main branch ("Merged PR xxx") became the *second parent* of this merge, and the last commit on the feature branch became the *first parent*. Now of course git doesn't actually care, and the final code is unchaged regardless, however all the tools that assume that `main` will always be the first parent are now confused, and follow the feature branch commits instead of the main branch commits. I still to this day don't know how this developer managed to achieve this, and it will remain in that particular client's git logs till the end of time.

## Understanding git logs

As you may have guessed by this point, it's pretty much a matter of pride for me that no matter what state the other developers have managed to get into, I can at least tell for a fact what they pushed to `main` in the end. And maybe I can help them do something cleaner next time with a bit of education on how to use git. Git doesn't make this easy, merge commits are pretty inpenetrable at times, and when you have a careless or ignorant group of developers the tramlines of branch history can look a [spider on too much caffeine](https://en.wikipedia.org/wiki/Effect_of_psychoactive_drugs_on_animals#Spiders) created the history.


Something that's been increasingly bothering me as a minor but irritating friction when trying to fathom what a developer contributed is that with only the tool of first-parent to hand, I can only either see the straight line history, or the full history of all branches that were merged in to main. That makes spotting the single line of commits from the merged in feature branch particularly tricky, especially if the developer didn't know how to rebase, started their branch from a really old main, and repeatedly merged main (and maybe a few other branches) in to their feature branch.

I finally got fed up with this gap, having encountered a long-running branch that was repeatedly merged into main, had more commits added, merged main back into the feature branch, and then the whole thing repeated all on the same branch. I was utterly defeated by this one. By four or five commits down I could no longer follow the tangle of branches and merges and couldn't tell what was on this developer's branch and what was other people's branches that had been merged in to main elsewhere.

So now for the exciting new bit. I think this might be completely novel, though please get in touch if you know of anyone who's talked about this before, or any tools that can do this. I know of neither…

## A new way to inspect merged feature branches

Here is a one-liner git command that allows you pass in the sha1 of any merge commit on `main` (usually a "Merge PR xxx" commit if you are following [github flow](https://docs.github.com/en/get-started/using-github/github-flow)) and shows a graphical log view of only the first-parent merge commits on main, and all the commits on the feature branch. Win.

```
merge_commit=8eb7b69; feature_branch=$(git log -m --pretty=format:"%H %P" $merge_commit -1 | cut -f 3 -d " "); git log --graph --oneline --decorate --color --first-parent $(git rev-list $feature_branch ^$merge_commit^) $(git rev-list $merge_commit --first-parent)
```

You can turn them into [git aliases for easy use](https://github.com/timabell/dotmatrix/blob/63687515a344f3a1bbc1beb5b95859527cc917f5/.gitconfig#L41-L42):

```sh
git config --global alias.trm '!f() { merge_commit=$1; feature_branch=$(git log -m --pretty=format:"%H %P" $merge_commit -1 | cut -f 3 -d " "); git log --graph --oneline --decorate --color --first-parent $(git rev-list $feature_branch ^$merge_commit^) $(git rev-list $merge_commit --first-parent); }; f'
git config --global alias.ggm '!f() { merge_commit=$1; feature_branch=$(git log -m --pretty=format:"%H %P" $merge_commit -1 | cut -f 3 -d " "); tig --first-parent $(git rev-list $feature_branch ^$merge_commit^) $(git rev-list $merge_commit --first-parent); }; f'
```

### Break down

Let's break down what how this works (oh no, I'm starting to write like gpt! halp!)

#### Store merge commit ref

Put the sha1 of the merge into a variable (because we need it more than once)

```sh
merge_commit=8eb7b69;
```

#### Find last feature branch commit before merge

This subcommand uses log to show the parent commit sha1s, then uses cut to find the second parent sha1, i.e. the top commit of the feature branch that was merged in.
```sh
feature_branch=$(git log -m --pretty=format:"%H %P" $merge_commit -1 | cut -f 3 -d " ")
```

#### Git log invocation

Standard git log formatting to get a nice graph, can be replaced with `tig` for a prettier graph, which is what I've done for my graphs below.
```sh
git log --graph --oneline --decorate --color
```

#### First parent filter (of main)

Show only "first-parent" commits. Normally git would follow all parents and include them all in the displayed graph. With this it will only follow the "first" parent (usually `main`, ignoring parent commits from the feature branch). This applies to everything shown, so if we didn't do rev-parse later we only get first-parent on the feature branch too (obscure but can be an important difference if the feature branch had its own merge commits, something that is common with devs that use the evil "sync" button blindly).
```sh
--first-parent
```

#### Find commits on feature branch

This uses [git rev-list](https://git-scm.com/docs/git-rev-list) to list all the commit sha1s that are in the feature branch, filtering out all the commits that are reachable from the last mainline commit before the feature was merged in to main.

```sh
$(git rev-list $feature_branch ^$merge_commit^)
```

The first argument, `$feature_branch`, just causes `rev-list` to list all the sha1s in the tree of parents of feature_branch (including feature branch itself).

The second parameter of rev-list would normally just add more sha1s to thie list, however…

The two carets (`^`) in the second argument are pretty confusing; they look like a pair but mean completely different things:

1. The caret at the end `…^` means the [first] *parent* commit of the merge_commit
2. The caret at the start `^…` is an inversion/negative filter, i.e. exclude all the sha1s that would have been included if they are also reachable from `$merge_commit^`

From the rev-list docs:

> `git rev-list [<options>] <commit>…​ [--] [<path>…​]`
>
> List commits that are reachable by following the `parent` links from the given commit(s), but exclude commits that are reachable from the one(s) given with a `^` in front of them.

If we put feature-branch-sha1 in the arg list for git-log then first-parent will filter that to only its first parents too. Seeing as we are trying to understand what the creator of the feature branch in its entirety we actually want to see all commits on that branch, even if it diverged and merged along the way. By using rev-list to list *all* the commits on that feature branch, and then feed that full list to git-log along with the merge commit sha1/ref we cunningly sidestep the first-parent and show all the commits anyway.

#### Include first-parent commits of main

This bit is optional, but it's useful to see the branch in the context of the list of first-parent commits of main. This gives an idea of just how out of date the feature branch became (i.e. it should probably have been rebased before merging, a "teachable moment").

```sh
$(git rev-list $merge_commit --first-parent)
```

## Demo

I've taken the time to create a demo repo that shows simplified version of a fairly typical git repository that uses the [github flow](https://docs.github.com/en/get-started/using-github/github-flow) branching model: <https://github.com/timabell/tramlines>. So now let's use that repo to demonstrate the use of this filtering:

The repo has two feature branches, A and B, that were worked on in parallel, and then both merged in to `main`. Feature B is fairly straigh forward branch, commit, merge. However feature A branched off while B was in progress, merged *after* B was merged in, had `main` merged into A along the way and for extra difficulty in following what happened it also split, had commit 2.1 and 2.2 done in parallel and then merged back together before finally merging in to `main`.

### Example repo history

This is the example in full up to the merge of feature A as rendered by tig:

```
$ tig 8eb7b69 # Shows everything, including irrelevant feature-B branch comnmits

8eb7b69 ●─╮ Merge branch 'feature-A'
7714120 │ ∙ Feature A commit 3
6fc7ea7 │ ●─╮ Merge branch 'feature-A-split' into feature-A
5cb45d7 │ │ ∙ Feature A commit 2.1
1cefe9d │ ∙ │ Feature A commit 2.2
cd5fdcd │ ●─┤ Merge branch 'main' into feature-A
c4d67c0 │ ∙ │ Feature A commit 1
b1755ab │ ∙ │ Add feature A
eefde39 ∙ │ │ Mainline commit 5
51168ce ●─│─│─╮ Merge branch 'feature-B'
b1cf72b │ │ │ ∙ Add feature B
5d16553 ∙─│─╯ │ Mainline commit 4
bf668c0 ∙ │ ╭─╯ Mainline commit 3
91c1da2 ∙─╯ │ Mainline commit 2
822449e ∙───╯ Mainline commit 1
2282f5f ◎ Initial commit
```

### Viewing feature A

Viewing feature A in isolation is not too hard, you can run a git log or tig on the last commit before it was merged in (`7714120`),

```
$ tig 7714120 # Missing context of main

7714120 ∙ Feature A commit 3
6fc7ea7 ●─╮ Merge branch 'feature-A-split' into feature-A
5cb45d7 │ ∙ Feature A commit 2.1
1cefe9d ∙ │ Feature A commit 2.2
cd5fdcd ●─┤ Merge branch 'main' into feature-A
5d16553 │ ∙ Mainline commit 4
bf668c0 │ ∙ Mainline commit 3
c4d67c0 ∙ │ Feature A commit 1
b1755ab ∙ │ Add feature A
91c1da2 ∙─╯ Mainline commit 2
822449e ∙ Mainline commit 1
```

However, I usually find it useful to see the log of `main` at the same time to see things like how out date the original branching off was, how `main` has progresses since, and get a feel for how the two relate.

### Unwanted full history

If you ask for a git log of main and the feature branch, you suddenly get every commit of every other branch that was merged in, which can be hard to follow even with really tidy teams.

```
$ tig 8eb7b69 7714120 # Includes too much extraneous detail

8eb7b69 ●─╮ Merge branch 'feature-A'
7714120 │ ∙ Feature A commit 3
6fc7ea7 │ ●─╮ Merge branch 'feature-A-split' into feature-A
5cb45d7 │ │ ∙ Feature A commit 2.1
1cefe9d │ ∙ │ Feature A commit 2.2
cd5fdcd │ ●─┤ Merge branch 'main' into feature-A
c4d67c0 │ ∙ │ Feature A commit 1
b1755ab │ ∙ │ Add feature A
eefde39 ∙ │ │ Mainline commit 5
51168ce ●─│─│─╮ Merge branch 'feature-B'
b1cf72b │ │ │ ∙ Add feature B     <===== UNWANTED
5d16553 ∙─│─╯ │ Mainline commit 4
bf668c0 ∙ │ ╭─╯ Mainline commit 3
91c1da2 ∙─╯ │ Mainline commit 2
822449e ∙───╯ Mainline commit 1
2282f5f ◎ Initial commit
```

### Over-eager first-parent filter

If you ask for first-parent with the sha1 of main and the branch you are no longer seeing everything that could be on the feature branch.

```
$ tig 8eb7b69 7714120 --first-parent # Misses commits on feature-A

8eb7b69 ∙ Merge branch 'feature-A'
7714120 │ ∙ Feature A commit 3
6fc7ea7 │ ∙ Merge branch 'feature-A-split' into feature-A
1cefe9d │ ∙ Feature A commit 2.2    <====== Where did 2.1 go?
cd5fdcd │ ∙ Merge branch 'main' into feature-A
c4d67c0 │ ∙ Feature A commit 1
b1755ab │ ∙ Add feature A
eefde39 ∙ │ Mainline commit 5
51168ce ∙ │ Merge branch 'feature-B'
5d16553 ∙ │ Mainline commit 4
bf668c0 ∙ │ Mainline commit 3
91c1da2 ∙─╯ Mainline commit 2
822449e ∙ Mainline commit 1
…
```

### The new command in action

So now we use our magical new command, and suddenly we get everything we want:

```
$ merge_commit=8eb7b69; feature_branch=$(git log -m --pretty=format:"%H %P" $merge_commit -1 | cut -f 3 -d " "); tig --first-parent $(git rev-list $feature_branch ^$merge_commit^) $(git rev-list $merge_commit --first-parent)

8eb7b69 ∙ Merge branch 'feature-A'
7714120 │ ∙ Feature A commit 3
6fc7ea7 │ ∙ Merge branch 'feature-A-split' into feature-A
5cb45d7 │ │ ∙ Feature A commit 2.1  <=== Note we get both of the
1cefe9d │ ∙ │ Feature A commit 2.2  <=== commits from the split
cd5fdcd │ ∙─╯ Merge branch 'main' into feature-A
c4d67c0 │ ∙ Feature A commit 1
b1755ab │ ∙ Add feature A
eefde39 ∙ │ Mainline commit 5
51168ce ∙ │ Merge branch 'feature-B'
5d16553 ∙ │ Mainline commit 4
bf668c0 ∙ │ Mainline commit 3
91c1da2 ∙─╯ Mainline commit 2
822449e ∙ Mainline commit 1
…
```

And there it is, everything we need to know about feature A in the context of the progress of the `main` branch. Magic.

(tig doesn't show the merges when it's done this way, but it's good enough to get an idea what's going on in the maze of tramlines.)

I'm afraid one particularly messy developer on one client did manage to create a history that defeated this approach by not only repeatedly merging to and from main along the way (which showed fine), but also cross merging with a different feature branch which was merged to main at a different point. As I say it never ceases to amaze me what people can come up with when not adhering to good branch hygeine. Hopefully that isn't something I'll run into again any time soon.

## Bonus merge investigation tools

There's a couple of extra obscure git commands for looking at what messy/inexperienced devs have concocted to confuse you:

By default [git doesn't show everything in a merge commit](https://stackoverflow.com/questions/40986518/how-to-git-show-the-diffs-for-a-merge-commit) - this is very confusing to say the least, but equally I get why it only shows what changed that you wouldn't expect if you just cleanly merged the two branches. Here's two commands that will let you inspect the full diff of a merge:

`git show --first-parent` - shows the patch of a merge commit

`git show --merge --patch` shows both sides of a merge commit

I also learned the existence of:

 `--ancestry-path[=<commit>]`, which I still don't understand well enough to explain

 and `--fork-point` which apparently [uses the local ref-log to try and find where a branch started](https://git-scm.com/docs/git-merge-base#_discussion_on_fork_point_mode)

 The rabbit hole of advanced git tooling goes very deep indeed, far deeper than I've explored here.

## Light relief

That was a bit much, so here's some light relief that shows you're not alone if you ever feel out of your depth with git: <https://xkcd.com/1597/>
