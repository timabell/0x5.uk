---
title: git - what do 'base' 'local' 'remote' mean?
layout: post
---

The terminology for 3-way git merge, rebase and cherry-pick conflict files is very confusing, particularly because they flip direction between rebase and merge.

When you run `git mergetool` it will spit out 4 files that look like this, and then pass them as arguments to your merge tool of choice:

```
$ gs 
## HEAD (no branch)
UU src/gitopolis.rs
?? src/gitopolis_BACKUP_1585963.rs
?? src/gitopolis_BASE_1585963.rs
?? src/gitopolis_LOCAL_1585963.rs
?? src/gitopolis_REMOTE_1585963.rs
```

In kdiff3 (by far the best 3-way merge algorithm out there) it looks like this:

![kdiff 3-way merge screenshot](/images/blog/git-kdiff-3way-merge.png)

## Here's how I think of it

### Merge

You are on the target branch (local), and the patches are coming from the branch you are merging in (remote), kinda like this:

```
git checkout local-branch
git merge remote-branch
```

### Cherry-pick

Same direction as merge.

You are on the target branch (local), and the patch is coming from the commit you are cherry-picking (remote), kinda like this:

```
git checkout local-branch
git cherry-pick some-remote-commit-ref
```

### Rebase

*Opposite* direction to merge.

You start on your own branch that you want to rebase, but...

When you start the rebase you end up temporarily while the rebase is running in "detached HEAD" on the branch you are rebasing onto (often `origin/main`), so:
You are on the target branch (local), and commits to rebase are coming from the branch you are rebasing (remote), kinda like this:

```
git checkout your-remote-branch
git rebase target-local-branch
```

## Terminology

- "**BASE**": before anyone changed it (in all cases)
- When **merging** (other branch coming to me):
	- **LOCAL**:  branch I'm on
	- **REMOTE**: branch I'm merging in

- When **cherry-picking** (other commit coming to me):
	- **LOCAL**:  branch I'm on
	- **REMOTE**: commit I'm merging in

- When **rebasing** (my own branch coming to me):
	- **LOCAL**:  branch I'm rebasing on to (checked out as detached head mid-rebase)
	- **REMOTE**: my commits on branch I'm rebasing

## Refs

* <https://stackoverflow.com/questions/20381677/in-a-git-merge-conflict-what-are-the-backup-base-local-and-remote-files-that>
