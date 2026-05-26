---
path: /2026/05/26/why-i-left-logseq-for-obsidian/
title: "Why I left Logseq for Obsidian after 2+ years (and what it means for markdown-neuraxis)"
---

I recently moved my personal notes from [Logseq](https://logseq.com/) to [Obsidian](https://obsidian.md/) after a bit over two years.

This was not something I thought I'd ever do given logseq is FOSS and Obsidian is Freeware.

When I originally chose a markdown PKMS, I filtered hard for local-first, markdown-first and open source. Obsidian got ruled out almost immediately because it isn’t open source. Logseq looked much closer to my principles and, for a long time, it was a genuinely great fit.

After the switch I wanted to understand *why* I actually moved, so of course (having been reborn as a child of the LLM era) I had got ChatGPT to interview me on the subject and used that to dig into my own reasons.

![screenshot: note from Jan 2024 when I first installed logseq](/images/blog/logseq-obsidian/shutter_20265-26_08.png)

![screenshot: note from May 2026 when I converted all notes from logseq to obsidian](/images/blog/logseq-obsidian/shutter_20265-26_09.png)

Here’s the result, tidied up a bit from my raw and rambling audio responses:

## Q: When did you first think you might leave Logseq?

I’m not sure there was one single dramatic moment. There had been a growing list of paper cuts for a while.

Logseq won’t really accept arbitrary markdown unless it’s in bullets, which made it impossible to combine with the rest of my markdown notes from my previous note-taking in VSCode and Markor. Logseq doesn’t believe in folders in the way I naturally think about folders. That philosophical distinction never really clicked for me and leaked into awkward file naming and structure.

But the big one was when Logseq announced the db-first rewrite.

That went against one of the main reasons I chose it in the first place: markdown-first local files.

Up until then I could tolerate quirks because the core worldview matched mine.

After that I started feeling less confident that we agreed on the fundamentals.

## Q: Before trying Obsidian, what did you expect to dislike?

Honestly, I barely looked at it originally.

It wasn’t open source, so I filtered it out immediately.

I knew it was popular. I could tell it was well-loved. But that didn’t matter because it failed the first-pass criteria.

Logseq Android had become a real frustration with my notes collection. Sometimes I’d open it to capture something, wait 30 seconds to a minute, and by then I’d forgotten what I wanted to write down.

At the same time [markdown-neuraxis](https://github.com/timabell/markdown-neuraxis) isn’t ready yet.

I’ve been building it, but it’s a huge amount of work and I couldn’t realistically jump to my own unfinished tool.

So I finally gave Obsidian a proper look.

And… it’s very good.

## Q: What made Obsidian feel safe enough to try despite being closed source?

Plain markdown files on disk.

That’s the key.

My notes are still mine.

I can sync them with Syncthing.

I’ve checked them into local Git as well.

I’m not uploading everything into a SaaS and hoping a company keeps behaving forever.

That matters because I’ve been through the opposite.

I used Trello for GTD for years. Loved it. Then it got acquired, the direction changed, and suddenly the timing of migration wasn’t under my control anymore.

That’s exactly the kind of thing I try to avoid with core tools.

Obsidian being proprietary still matters to me.

But markdown on disk plus local sync means the lock-in risk is much lower than a typical SaaS product.

## Q: What impressed you most?

Quite a lot.

The folder navigation immediately felt right.

Being able to move files and tidy up structure naturally was a big deal, I was immediately able to clean up a lot of the mess in my existing notes, improve the structure and add more of the PARA structures.

The desktop UI is polished and well thought through.

Tabs and split panes are genuinely well done. I’d been thinking about splits in markdown-neuraxis and wasn’t planning tabs. Using Obsidian made me rethink that — they serve different purposes and both are useful.

The mobile app was the biggest surprise.

It’s responsive.

Nicely designed.

Fast enough to capture thoughts with minimal friction.

And they’ve been surprisingly restrained commercially.

Given that it’s closed source I expected more pushiness.

## Q: What do you still miss from Logseq?

A few real things.

Block references are brilliant.

Deep outlining is brilliant, though that mostly seems to work in Obsidian too. Logseq taught me to really use it and I'll take that with me.

For technical investigations especially, arbitrarily nested bullets with collapse/expand is fantastic.

That works really well when tracing complicated systems.

It works even better now with LLMs — I can ask for structured analysis with GitHub permalinks and paste it straight into markdown.

Logseq’s live editing view also felt better in some places.

And I still appreciate that it’s open source.

## Q: So why leave logseq?

Because the overall fit stopped working.

I wanted:

* one combined markdown vault including older notes
* normal folders
* easier file management
* faster Android capture
* a workable GTD flow
* fewer fights with the tool

Obsidian gave me that immediately. I'd hit the limits of Logseq for what I wanted to do with GTD, plus with the combination of a move to db-first and a unusable lag on mobile there was a strong need to find an alternative.

## Q: What’s still missing for you in Obsidian?

Less than I expected, honestly — but there are still some important gaps.

### foss

The obvious one is **it isn’t open source**.

That’s not just a philosophical checkbox for me. For core tools I genuinely care about being able to inspect the code, trust that it can’t suddenly be closed off further later, and know I can keep iterating on it indefinitely under my own control.

Obsidian does a lot right around local files and data ownership, and I genuinely appreciate that. My notes are plain markdown on disk. I can sync them with Syncthing and version them with Git. That matters a lot.

But there’s still a meaningful difference between:
*“my data is portable”*
and
*“the tool itself is libre software.”*

That tension hasn’t gone away.

Then there are the workflow details:

### block refs

A big one is **block references**.

Logseq absolutely nails block refs.

Being able to point directly at one thought or one chunk of a note — not just link a whole page — is incredibly useful.

That matters a lot in technical work:

* investigations
* architecture notes
* debugging trails
* collecting fragments from different places without duplicating them

Obsidian has links and embeds and a huge plugin ecosystem, but Logseq’s block refs feel much more native and fluid.

That’s one area where Logseq still feels ahead for me.

Then there are the smaller paper cuts.

### aliases

Page aliases are okay, but I’m not fully convinced by how they work yet.

Creating a note by navigating to something that doesn’t exist yet immediately creates an empty file on disk, which irritates me more than it probably should. It feels premature — like the filesystem changed before I’d actually decided to write anything.

### checkbox existence toggling
Checkboxes are another tiny-but-real one.

In Logseq they’re tri-state, including removing the checkbox cleanly. In Obsidian it works, but feels slightly more awkward and you become aware of the markdown syntax underneath in a way that breaks the illusion a bit.

### flexible prefix states

And I’m still figuring out task workflows.

Logseq’s TODO / DOING / DONE markers had a nice clarity. Obsidian can absolutely do tasks — probably very well — but I haven’t yet landed on the setup that feels quite right for me.

So the honest answer is:

Obsidian is excellent.

Much better than I expected.

But it still leaves me wanting:

* open source
* long-term control over the software itself
* native-feeling block references
* and a few workflow-specific UX details tuned exactly how I’d want them

Which, interestingly, is what keeps markdown-neuraxis feeling worth building after the initial wobble.

## Q: Did Obsidian change how you feel about markdown-neuraxis?

Absolutely.

My first reaction was:

**“Oh no. Did I just waste months building this?”**

That was real.

Obsidian is good enough that I had a proper wobble.

But after living with it a bit, that settled.

It clarified what Obsidian gets very right.

And it also clarified what still matters to me:

* open source
* long-term control
* something I can iterate on forever
* a markdown-first PKMS
* native desktop and Android
* wiki links
* GTD workflows
* fewer paper cuts around the specific workflows I care about

There still isn’t a FOSS markdown-first notes app that fully covers that combination for me.

So if anything, using Obsidian has sharpened what I want markdown-neuraxis to be.

And it’s useful to learn from the biggest player in the space rather than guessing from the outside.

## Q: Would you recommend other Logseq users switch?

Not as a blanket recommendation.

It completely depends what you care about.

If someone values:

* markdown-first files
* and is okay flexing on open source

…then yes, I’d absolutely say try Obsidian.

It’s exceptionally good.

But Logseq still has real strengths.

Its querying model is unique.

Its outlining model is powerful.

And some people clearly love where it’s going.

So I wouldn’t say:

“you should switch.”

I’d say:

“I switched because of my own priorities and workflows.”

Then I’d ask what they care about.

## Final thoughts

I’m genuinely grateful for both tools.

Logseq helped me a lot for over two years.

Obsidian has surprised me in a very positive way.

And markdown-neuraxis still feels worth building.

If anything, trying both seriously has made the tradeoffs clearer.

Which is probably the best place to be when building tools in this space.
