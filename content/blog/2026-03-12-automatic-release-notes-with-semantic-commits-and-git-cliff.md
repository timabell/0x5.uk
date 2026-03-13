+++
path = "/2026/03/12/automatic-release-notes-with-semantic-commits-and-git-cliff/"
title = "Automatic release notes with semantic commits and git-cliff"
[taxonomies]
tags = ["git-workflow", "development-practices"]
+++

"What's going out in this release?" - A question that always seems to be more hassle than it should be. I've wanted to automate release notes for years, but have just never quite got there till now. It's taken a while to put together all the necessary parts, and has taken quite a bit of [ongoing] learning about how to effectively operate the system which I'll share with you here.

This is 110% a "standing on the shoulders of giants" post as you will see.

## Backstory

Thanks to the combined creation of "[semantic/conventional commits](https://www.conventionalcommits.org/)" and [git-cliff](https://git-cliff.org/) I have finally been able to prove out the concept of generating release notes completely automatically from nothing but git commit logs on some of my open source projects, and even been able experiment with it in a commercial setting on teams of developers which has certainly caused some interest.

I started experimenting with "conventional commits" — i.e. prefixing commit message subject lines with "`feat:`" or "`fix:`" etc. — at least as early as 2023. Hunting around I can find a commit from one of my open source projects from Dec 2023: ["feat: Render sections in order they were parsed" · github/timabell/SlnEditor@d0d6e5c](https://github.com/timabell/SlnEditor/commit/d0d6e5c9ed1ae9c35eafb1acfc2da01908bcd3c1), and I think I may have dabbled with the idea in private projects before then.

Even though the idea of neatly categorized commits seemed theoretically appealing, I struggled to stick to doing it as it seemed to lack any deep value. It was hard to figure out what "good" looked like without some concrete goal or output. The list of commits looked maybe a bit tidier but it didn't seem worth all the time agonizing over what prefixes to use for every commit.

All that changed recently when I finally managed to connect that with the automatic release note generation. Suddenly they had a purpose, and more importantly I could look at the release notes that were generated and assess whether the git logs had led to a good quality release note that would actually be meaningful to the end user of the software or library.

## A real example

So that you don't doze of while we go through all the detail, let's cut to the chase of what we get out of this semantic commit + cliff setup.

Here's a real example of a release note from one of my open source tools.

> <https://github.com/timabell/gitopolis/releases/tag/v1.13.0>
> ### [1.13.0] - 2025-11-28
>
> #### <!--1-->Features
>
> - Respect remote names and default to origin when cloning (#222, #246)
>
> #### <!--2-->Bug Fixes
>
> - Skip adding remotes when repo already exists during clone (#247)

Note that it focus *only* on the things that an end user would actually care about - what was fixed, and what new features are available. It is *not* a complete log of everything that has been done to get there, that is what the git logs are for.

This release note for [gitopolis](https://github.com/timabell/gitopolis) release "[v1.13.0](https://github.com/timabell/gitopolis/releases/tag/v1.13.0)" was generated automatically by git-cliff from by parsing all the commits since the previous release tag up to the current release tag.

The full graph of git commits since the previous release is as follows:

```
╰─$ git log --graph --oneline v1.12.4..v1.13.0
*   373123a (tag: v1.13.0) Improve multi-remote handling
|\
| * 323a66b Strip \\?\ prefix from Windows extended-length paths in tests
| * c3bfe0f Normalize backslashes in temp path for Windows compatibility
| * 201873c Use canonicalize for temp path in clone tests for macOS compatibility
| * 8797e75 fix: Skip adding remotes when repo already exists during clone (#247)
| * 305123b Strip temp path prefix in clone tests for git's absolute path behavior
| * 20edf05 feat: Respect remote names and default to origin when cloning (#222, #246)
|/
* a6e6e8c Script for testing cliff release notes
* 0961469 ci: Build all branches
* ee82e95 Add Arch install instructions
* ecb6d40 Add crates.io install to readme
```

You'll note that only two of them show up in release notes:

```
* 8797e75 fix: Skip adding remotes when repo already exists during clone (#247)
* 20edf05 feat: Respect remote names and default to origin when cloning (#222, #246)
```

and all the rest are ignored, including the `ci:` commit.

This is intentional, and gives the best of both worlds - the ability to do the behind-the-scenes work that users don't directly care about that enables a good quality product — including github actions / ci improvements — without cluttering up the release notes available to the end user while simultaneously being able to surgically craft the release notes that we want as we do the work of coding, committing and merging.

You'll also note that that those two commits are on a branch that was subsequently merged to main, just like in the normal pull-request flow, which means we can build up release notes during our normal flow of working on feature branches, including previewing what release note *would* be generated if this was released. Even better for teams, this means the release notes can be part of what is reviewed during pull request review.

## Setting up & configuring

In the days of ai-coding, you can pretty much just ask your favourite LLM (claude code in my case) to write a `cliff.toml` file for you to meet your specific needs. I've written a few variations lately for different purposes. How you set it up depends on what kind of project you are working on, and how mature the release process is or can be.

### Open source library projects

I've created a demonstration project [github-nuget-demo](https://github.com/timabell/github-nuget-demo) that demonstrates automatic release notes, plus some other advanced release processes:

- Generation of release notes from git commit logs
- Automatic versioning of the library based on putting `bump: major/minor` in the commit messages - this allows managing [semantic versioning](https://semver.org/) in the very commit that introduces the breaking/non-breaking changes.
- Automatic build/test & publish to
  - github releases
  - nuget.org package hosting (would work for npm, crates.io (rust) etc etc)
- Automatic git tagging

Take a look at the [github actions](https://github.com/timabell/github-nuget-demo/tree/main/.github) to see how it all hangs together.

In there you'll find the [cliff.toml](https://github.com/timabell/github-nuget-demo/blob/main/.github/cliff.toml) that defines how to parse the commits.

You'll also find a [detect-bump.sh shell script](https://github.com/timabell/github-nuget-demo/blob/main/.github/workflows/detect-bump.sh) because although cliff has some version management capabilities built in, I fell of the edge of its built in capabilities when I wanted to find `bump:` in the commit footer in order to decide how much to bump the version. git-cliff does the actual version bump calculation for us, including finding the previous version number.

### Commercial projects with Jira

For non-library projects we don't want the automatic versioning, and might not want the automated releasing. And where the automated release/deploy is less advanced me want to be able to arbitrarily answer the question "what's in the next release if we cut from `main` now". While still using the manual tagging of released.

For that you can find an [example of a bash script that can be manually run at any point here](https://github.com/DEFRA/epr-regulator-service/tree/a3032da1ae9b83199a75a4c1bb82eda188ea45b2/pipelines/release-notes).

This example — in addition to looking for semantic commit prefixes like `feat:` — also hunts for jira URLs in the commit bodies, and then is able to say which jira tickets are completed in this release, and which are merely mentioned or worked towards.

### cliff config example

Here's the cliff.toml from the nuget example

```toml
[changelog]
header = ""
body = """
{% if version %}## Release {{ version }}
{% endif %}\
{% for group, commits in commits | group_by(attribute="group") %}
### {{ group | striptags | trim | upper_first }}

{% for commit in commits %}\
- {{ commit.message | split(pat="\n") | first | split(pat=": ") | slice(start=1) | join(sep=": ") | upper_first }} ({{ commit.id }})
{% endfor %}
{% endfor %}\
"""
footer = ""
trim = true

[git]
conventional_commits = false
filter_unconventional = false
split_commits = false
commit_parsers = [
    { message = "^feat", group = "<!-- 1 -->✨ Features" },
    { message = "^fix", group = "<!-- 2 -->🐛 Bug Fixes" },
    { message = "^perf", group = "<!-- 3 -->⚡ Performance" },
    { message = "^doc", group = "<!-- 4 -->📚 Documentation" },
    { message = "^style", group = "<!-- 5 -->🎨 Style" },
]
filter_commits = false
tag_pattern = "v[0-9].*"
```

You can see how it gives a templated release note, and then a bunch config showing how to parse commit messages and turn them into headings for release notes.

- The numbered html comments are a hack to make it put the headings in the right order in the output.
- The pattern matching for release tags has been customized to match semantic-version tags.
- The booleans are set to ignore commits that don't have the prefix

## Crafting commit messages

Once you (or someone else on your project) as set up the automation/scripting for release notes (and optionally automated releases, semantic versioning and tagging), then you not only have to [write your git commits for future readers of git logs](/2016/03/18/yet-another-good-commit-messages-post/) — something I hope you and your team already do — you now have a *new* audience to write for: the end users of your software. Plus if you are in a software delivery organisation you are also writing for all the other people involved that need to understand what is being released (product managers/owners, sales, engineering leaders, C-suite, marketing etc etc). That's a lot to consider if you are used to just writing "wip", "[misc bugfixes](https://xkcd.com/1296/)" or "Fix ticket 123" as your entire commit message.

My first attempts at writing commit messages to feed into automated releases produced pretty dismal results. When I looked at the generated release notes I ended up manually rewriting most of what had been created - it had too much detail, too little detail, technical details irrelevant to the end user, duplicated entries etc etc.

Over time — by nothing more than the simple feedback loop of writing commits, previewing release notes, publishing releases and reviewing the resultant notes — I slowly got better and better at writing the commit messages the first time round that would make for nice release notes, making some tweaks to the cliff config along the way (in the same branch) when it didn't quite produce the desired results.

I also learned to shift-left and get faster feedback by more regularly running the preview of the release notes on my feature branch as I went along. Once you have merged a branch it's a lot more painful to tweak messages, and if your team has the main branch protected it may just be too late by the time the branch is merged to fix the generated release notes.

There isn't really any magic here. Write some commits, preview the release notes, and think about whether they would read well for your end users. Repeat until you get good results and happy users. The main thing is just having convenient infrastructure and scripting set up to make that easy.


### Mainline & pull requests

There is no shortage of bike-shedding about git branching structures ([trunk based](https://trunkbaseddevelopment.com/), [github flow](https://docs.github.com/en/get-started/using-github/github-flow), [git flow](https://www.endoflineblog.com/gitflow-considered-harmful), [straight-line only](https://0x5.uk/2024/04/18/trunk-based-development-is-wrong/)).

When I started this journey I was a bit confused about where to put these magical release-note-generating commit messages. It originally seemed to me that it would make sense to have every commit on `main` have one of these prefixes to describe what type of commit it is - `feat: Some feature`, `refactor: Reformat things`, `fix: Fix bug in X`, but having attempted that for a bit I found it was sometimes really hard to work out what category to put everything in; and when I looked at the final list from a user perspective of "what changed" I just couldn't see the wood for the trees. Then there is the issue of the standard "github flow" of creating a feature branch, adding a set of [clear and well described] commits, and then creating a merge commit back into main (with or without github's help) - where should these prefixes go? In just the merge commits? In the branch commits? Both?

It was only when I actually started generating real release notes that I realized it's actually very simple:

1. There should be *one* "conventional commit" in the branch for each thing you want in the release notes
2. Everything else leading to that, including refactors and groundwork towards that thing should **not** have the conventional commit prefix.
3. git-cliff should be configured to ignore anything lacking the prefix

That way all you have to do is make sure you have one commit with the right prefix *somewhere* in your branch for each thing you want to show in the release notes. Everything else can carry on being committed as you always have done without affecting the release notes.

Ideally you are careful with your commits, and they all lead up to a commit that makes the feature or fix "done" which is the one with the special prefix. But even if you are still in the land of "wip" and "fixup" and "oopsie" commit messages, so long as you throw one well written "feat: Something users care about" you'll still get good release notes.

Better still, if you are doing pull requests and reviews - the generation of release notes from your not-yet-merged feature branch can be checked as part of the review, so you can even peer-review your release notes.

### Not every commit is worthy of inclusion

I originally thought *every* commit had to have some kind of prefix. Including `ci:`, `refactor:` etc.

Having actually practiced with generation of real notes I've realised:

1. It's okay to put prefixes on commits for `ci:` and `refactor:` - but they should be skipped when building release notes. End users of a library or web app don't generally care about your cleanup and your build/deploy pipeline
2. All the other normal development work can just not have the prefix - and **that is okay**. Just because you are using the fancy-sounding "conventional commits" to generate release notes doesn't mean you have to dogmatically prefix every commit. I mean, if you *want* to prefix everything with prefixes or [even emoji](https://gitmoji.dev/) then knock yourself out, but you only need to scan for a few key entries for release note generation (feat, fix, perf).

### Who are you writing release notes for

You presumably have a reason you are even bothering with release notes. And you presumably have someone who wants to know what's in a release. Otherwise why would you bother with any of this.

If you are continuously-deploying an e-commerce site, then maybe no-one cares and you should just focus on shipping whatever as fast as possible. Your product owner probably already knows what they asked you to do, and a kanban board of todo/doing/done might be enough.

If you are writing a library for other developers then it's pretty standard to use semantic versioning to indicate whether changes are likely to break api compatibility, and it's pretty normal for users of a library to expect to have some explanation of what changed between published versions (and no "security and performance updates" is not good enough). If this is the case, then all you have to do when writing your semantic commits for your release notes is consider what the library user would want to know and write your commits in those terms. Then check the preview of the release notes to make sure it came out as you planned.

If you are writing some kind of deployed app, say a microservice or web-app, then you have to consider your versioning strategy, why you even need release notes, and who your audience is. This could be an internal audience - say customer services or marketing, or it could be something you publish online for your end users. Whoever it is, make sure you preview your release notes as you go to ensure they are written with those people in mind, and write it the same way you would explain it to them on a call.

Better still get feedback from actual end users on how well the release notes are helping them, and then use that to drive even better semantic commit writing.

### Ticket URLs

It's worth adding full ticket or github issue URLs to the end of your commit message(s) regardless of release notes - it makes it much easier for future readers of git logs to find the relevant ticket/issue, and by using full URLs instead of just numbers it prevents confusion later on over which system they refer to (teams do sometimes change their ticketing systems).

You can configure git-cliff to hunt for those ticket/issue URLs and include them in the release notes. This is a nice touch and make it easier to quickly jump from release notes back to the ticket.

For github issues you only need to include the number with a hash and it'll autolink those if it finds them in release notes (e.g. `Some fix (#123)`). I got cliff to find the "Fixes <issue_url>" in the commit footer (which also automagically closes the issue when merged to main) and suffix it on the line in the release notes.

Having run this for a while I ran into a complication with ticket links: sometimes you'll do some work that is related to or works towards a ticket, but **doesn't actually finish the feature** as far as an end user is concerned. If you were to then include that ticket in the release notes the user (or your wider team) would wonder why you have said it's done when it's not. To get around this I recommend using the "Fixes <ticket_url>" for when you have completed a feature/fix, and the bare "<ticket_url>" with no prefix in the footer of your commit messages to make it clear whether it is complete or just related; and then configure cliff so that anything that doesn't have the "Fixes" prefix ends up in a "Related work" or "Work towards" section.

### Get started then iterate

It's hard to get this reliably right first time, but get that feedback cycle going by getting the tooling in place, starting the practice of writing commits in this style and looking at the generated release notes.

If you are sharing release notes manually you can always review and edit them if you can't get them exactly right, but the closer you can get to complete automation the better.

It's better to get started imperfectly now and improve than to put it off because the results aren't perfect.

You'll find it takes time to get the automation and parsing just right, *and* take time for the team to get the hang of getting the messages just right to generated high quality release notes. Help each other out, practice and iterate.

## Over to you

This is the ultimate shift-left on release notes. You are now crafting your release notes **at the same time** as you are crafting the code for the feature for your dear users.

It seems to be a fairly uncommon practice currently, but it's now pretty easily achievable with a bit of time on the tooling and a bit of practice from the devs in writing commits in this style. I'm keen to help with adoption of this improvement, and I believe a key piece of the puzzle is knowing it's possible and how to do it effectively, as such I want to make this post a good reference guide to jump-start teams who'd like to get this going as a practice. Please do give me a shout if you'd like to talk it over, and let me know if you think I've missed anything, anything isn't clear, or if you disagree with any of it.

And please do give it a go, and report back with how you get on.

## Further reading / references

- [git-cliff - "A highly customizable changelog generator"](https://git-cliff.org/)
- [conventionalcommits.org: Conventional Commits](https://www.conventionalcommits.org/)
- [Semantic Commit Messages · joshbuchea](https://gist.github.com/joshbuchea/6f47e86d2510bce28f8e7f42ae84c716)
- [How to use Semantic commits properly - DEV Community](https://dev.to/yanpi/semantic-commits-2j83)
- [github-nuget-demo](https://github.com/timabell/github-nuget-demo)

## Addendum — em-dashes

Before anyone complains that AI wrote this post, I put the em-dashes in manually, I wrote this entire blog post by hand — unless you count `vim` — and did not even have the LLM do editing or proof reading.

Thanks to the world of LLM output I actually now know what an em-dash is and how to use it when writing. So with that, I can totally own all the em-dashes, typos mistakes and errors herein. Enjoy!
