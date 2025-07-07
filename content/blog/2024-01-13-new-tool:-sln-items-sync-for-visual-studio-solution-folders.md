---
title: "New tool: sln-items-sync for Visual Studio solution folders"
layout: post
---

How and why I created `sln-items-sync`  - a `dotnet tool` to generate SolutionItems from filesystem folders.

If you want to skip the backstory head over: <https://github.com/timabell/sln-items-sync>

## 15 years of minor irritation

Faced with another set of microservice repos written in dotnet-core, with `.sln` files in various states of tidiness I found my self for the 1000th time in 15+ years manually pointy clicky adding fake solution-items folders and subfolders and then toiling away adding files **just** so I could search them, click them and view them from within Visual Studio or Rider.

There must be a better way by now I thought, so I went hunting.

All I turned up was a lot of people asking the same thing and some dead tooling from years ago. Here's the stackoverflow from 2008 with 90k views and 180 upvotes: <https://stackoverflow.com/questions/267200/visual-studio-solutions-folder-as-real-folders>, which didn't really help in spite of having 23 answers. Not to mention the slew of linked questions where people are asking the same thing with different words.

(Solution folders aren't to be confused with adding files to a *project* which used to be an equal nightmare before Microsoft saw sense and just included *what's on the filesystem*. There are many old stackoverflow questions on that too from frustrated devs around the world.)


![screenshot of example solution items folder in Rider](/images/blog/sln-items.png)

So with the programmer war cry of "how hard can it be, I'll knock this out in a couple of evenings..." I set about on what turned out to be a significant exercise in yak-shaving in order to sort it out myself once and for all.

> "How hard can it be, I'll knock this out in a couple of evenings..."
>
> ~ Me. Again.

## What to build?

I did briefly look at writing an IntelliJ (aka Rider) plugin but that turned out quickly to be a daunting thing so I put that idea down sharpish.

I use Rider in preference to Visual Studio and VSCode for C# so didn't even look at that side. VSCode didn't even bother with .sln files last I checked.

Next step was to write a CLI (command-line interface, aka terminal) tool to do it. (sln + filesystem in, mutated sln out, easy...)

I have recently written command line tools in both GoLang and Rust, but given this is a tool that would only be useful to Microsoft developers I figured I'd do this one in C#. I do actually like C# as a language for all my interest in other things, and thanks to dotnet-core and Rider I can actually write the whole thing on Linux Mint Cinnamon where I like to be.

## Parsing and writing .sln files

I then hunted around for any nuget packages that might do the grunt work of reading/writing the sln format. Surely after 20-something years there must be something, right? Well, kinda. The VS parsing code is locked away in some windows dll nastyness, probably in C++ and COM or something evil. It even predates XML as a format, never mind JSON.

What I did find was the [SlnParser nuget package](https://www.nuget.org/packages/SlnParser), which someone had kindly written and open-sourced, and after quick test I could see it did a decent job of turning .sln files into an in-memory C# object model (a `Solution` class, with lists of things as properties).

So major yak number one was to fork SlnParser and turn it into a two-way tool. This I did with a lot of hackery and created [SlnEditor nuget package](https://www.nuget.org/packages/SlnEditor/) which I published on nuget and github with the same Unlicense licensing as the original. Perhaps others will find this gift to the world useful in its own right.

## Creating sln-items-sync

Finally with that working I was able to create the CLI tool I wanted, which I named [sln-items-sync](https://github.com/timabell/sln-items-sync). This was more work than I expected, but I got a first cut working reasonably quickly.

## Tests

I put a good amount of effort into good end to end test coverage on both the parser and the tool itself because I am now a true believer that **without tests** you will be **unable to make future changes and dependency upgrades with speed and confidence**.

I.e. lack of tests is the epitome of technical debt.

In fact let me give that a block quote because it's such an important point:

> Lack of tests is the epitome of technical debt.

(p.s. why is Epitome spelled that way but pronounced epitomy. English. Sigh.)


This has paid off in spades as the amount of work to get it satisfactorily "done" grew and grew the closer I got to finished.

The tests in both projects focus on "outside-in" testing rather than mockist unit testing. As such you can see at a glance the overall behaviour, spot any unexpected/unwanted output, and easily write new tests for new desired behaviour, being able to eyeball them easily for correctness. I won't include one here as they are a bit lengthy, but you can go and look at the source repos on github.

This is made a bit easier on this tool because the only interfaces to the world are:

- a text format (easy to string-compare expected versus actual)
- a filesystem (I went for creating real file trees in tests which worked well and gives even more confidence)
- the command line interface (for the sync tool)
- the API (for the parser lib)

## First contact with real .sln files

As I am doing some work for a C# contracting client currently I was able to try it out on gnarly real solution files, with a view to submitting some small cleanup pull requests that could created really quickly.

### Stable ordering

The first attempt was a complete failure because the generated patch re-wrote the entire sln file in a completely different order, resulting in a sea of red/green lines full of GUIDs and other cryptic changes in the git diff. While the solution items were updated as intended and could be seen in Rider etc., this was not a patch that could be submitted to the team, or that I would put my name to.

Getting stable ordering between parsing and writing turned out to be a huge amount of work and refactoring, largely in the SlnEditor lib.

The key to making stable-ordering work was to add an `int sourceLine` property to almost everything when parsing, and to sort by that before rendering back out again. This had the desired effect of keeping everything in the original order no matter how it was mutated, and new items are added to the end (by replacing default `0` with `Int.MaxValue` before sorting).

Phew, another yak shaved, lost count now, but got more xmas hols so keep going....!

## Many bugs and gaps

It surprised me a bit just how many [little niggles, edge cases, and small omissions](https://github.com/timabell/sln-items-sync/issues?q=is%3Aissue+is%3Aclosed) there were that had to be sorted out before I could use it to submit quality patches to client .sln files for real. Even the ever present byte-order-marker (BOM) was causing unwanted diffs because I hadn't included it in the render, but .sln files seem to have them.

Pleasingly I've resolved everything I came across, apart from making the parent/child guid mapping order stable which didn't seem to be worth the effort seeing as they are completely incomprehensible anyway.

## Making a dotnet-tool

Once it was working, it was only a couple of rounds of building and copying the exe to `bin/` before I got fed up with that approach to distribution.

Amazingly it turns out to be pretty simple to build and publish tools to the `dotnet tool` ecosystem, they are actually just slightly special nuget packages, and you only have to add a couple of properties to the `.csproj` file.

Making a dotnet-tool worked great, and is a great user experience for installing and running the tool. It even does updates for no extra effort!

## Github-actions

To make both of these tools even easier to work on and maintain longer term, I wanted to have a good github action (aka CI) to build and run the tests.

Build and test is trivial, you can pretty much click the default workflow button for .net in an empty github actions page and it just works.

I wanted to also automate the nuget publishing of both from github-actions, as although I had a sh file to upload them from my machine that's a faff and tends to stop working after a few machine rebuilds. Amazingly the author of SlnParser has taken an interest and provided a [PR that gave me a ready-made github-action to push to nuget](https://github.com/timabell/sln-items-sync/pull/15) for every release tag! So that's now in place, and to release a new version I can just `git tag v1.2.3 && git push --tags` and github does the rest.

## The end, I need a lie down

So after all that, I'm not sure it was all worth it, but it's done and I'm justifying it as a holiday hobby project and a gift to the dotnet developers of the world. I will certainly enjoy it every time I find an out of sync `SolutionItems` folder in future and run my tool so that I can ship a patch for it in seconds flat. I also learned a few things and got kata-like practice on shipping quality things at speed.

So with that, Merry Xmas and a happy new 2024. May all your solution folders be tidy and complete.
