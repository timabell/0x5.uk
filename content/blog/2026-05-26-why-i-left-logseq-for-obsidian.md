---
path: /2026/05/26/why-i-left-logseq-for-obsidian/
title: "Why I left Logseq for Obsidian after 2+ years (and what it means for markdown-neuraxis)"
---

I recently moved my personal notes from [Logseq](https://logseq.com/) to [Obsidian](https://obsidian.md/) after a bit over two years.

This was not something I thought I'd ever do given logseq is proper FOSS whereas Obsidian is only closed-source "Freeware".

When I originally chose a markdown PKMS, I was looking for a local-first, markdown-first and open source tool. Obsidian got ruled out immediately because it is not open source, but now here I am using Obsidian every day, with all my notes from logseq transferred across and logseq no longer in use at all.

After the switch I found it a bit tricky to explain *why* I actually moved, so I had ChatGPT interview me on the subject to help me dig into my own underlying reasons so that I could more clearly explain the logic.

The original interaction with GPT was it writing the question and me using its voice-to-text to ramble out a thoughtful reply. I then got GPT to condense my wandering thoughts and responses into a more coherent response. I published that to this blog post, but after reading it back and reflecting on it it had too much LLM and not enough authentic me. So what follows is the original GPT questions, but this time with my own replies written *without* the aid of any LLMs. Enjoy!

---


### My first logseq note, imported into Obsidian (Jan 2024)

![screenshot: note from Jan 2024 when I first installed logseq](/images/blog/logseq-obsidian/shutter_20265-26_08.png)

### My first note in Obsidian (May 2026)

![screenshot: note from May 2026 when I converted all notes from logseq to obsidian](/images/blog/logseq-obsidian/shutter_20265-26_09.png)


## Q: When did you first think you might leave Logseq?

I don't think there was a particular moment, more a gradual build up of reasons to look elsewhere.

When I heard that Logseq was moving from **markdown-first** to **[database-first](https://discuss.logseq.com/t/why-the-database-version-and-how-its-going/26744)** I immediately knew that it was only a matter of time before I'd move to something else, as markdown as the primary source of truth is a core principle (see [my text-based-tools post](/2023/06/01/text-based-tools-the-ultimate-format-for-everything/) for more on that). I am skeptical that a notes tool that centers around a database will be able to provide an ideal experience for someone like me who primarily cares about the `.md` files on disk, and for whom the database is just a throwaway cache to make backlinks etc speedy. So that was obviously a big thing, however the db version as of time of writing is still in early beta, and the markdown-first version was still around, so not an immediate reason to move in itself.

I've known for a long time that Logseq probably wasn't the final answer. It insists on everything being bullets, and refuses to load notes from folders (I tried, it barfed because I had `foo/index.md` *and* `bar/index.md`). This meant I had half my notes stuck in my previous VSCode + Markor setup, and half in the more actively used Logseq, and could never combine them.

The Logseq android mobile app is borderline unusable, and capture on the go is a key capability for me for my notes. In my experience with about 1000 md file the android app would take ~60 seconds to be ready to type in, by which time I'd sometimes forgotten what I was going to note down. Given it's gone from the play store and there has been no news of improvements or any new releases for a long time I figure that isn't likely to change any time soon.

## Q: Before trying Obsidian, what did you expect to dislike?

Well, given it is closed-source I never even looked at it or gave it any further thought originally.

I knew it was popular, and well regarded based on what little I had seen online and on youtube, but that was about it.

I think I was rather expecting it to not really match my expectations of the perfect PKMS, I've seen a lot of software in my many years being fascinated with tech, ever since my first experience with a friend's [Speak & Spell](https://en.wikipedia.org/wiki/Speak_%26_Spell_(toy)) more than a few years back; and largely there has always been a ton of things that are annoying/broken/missing on all software I've ever used. In fact I rather have the curse of being able to immediately find edge case bugs in software I'm trying to just use like a normal person even when I'm not actually looking for bugs (which I do actively hunt for in my day job as a developer). So I'm a bit jaded, and my expectations of yet-another-tool were not especially high, especially a shiny closed-source / freeware bit of software. (At least you can in theory fix open source software if there is something wrong with it, with closed-source you are S.O.L. ("seriously" out of luck)).

However even with these tempered expectations, my own project to create my own perfect open source PKMS — [markdown-neuraxis](https://github.com/timabell/markdown-neuraxis) — is still far from ready for dogfooding for all but the most basic notes (though I did manage to use it as a meds checklist recently).

I also have been burned by "enshittification" of commercial software - for which there is no defense but to leave. With open source there is often a fork if the original maintainer does something seriously anti-user.

So yeah, I gritted my teeth for another medium term investment in getting to know another tool that would likely be temporary and moved everything over to a new "vault".

And... well, I was surprised by how good Obsidian actually is.

## Q: What made Obsidian feel safe enough to try despite being closed source?

It stores all my data as plain markdown files on local disk. No requirement to put anything in the cloud. So moving away to another tool will be simply a case of putting all my files somewhere else, and migrating whatever odd formatting / tooling artifacts Obsidian leaves embedded in the files and folders.

My notes are still mine, I can still use the unreasonably excellent [syncthing](https://syncthing.net/) (also FOSS and local-first) to sync notes. I've even checked my folder of markdown file notes (i.e. my "vault") into git before letting Obsidian near, which means it'll be much harder to lose anything major I care about while stumbling around learning a new tool. I can also more easily see with the git-diffs what it's actually doing to the files on disk.

I used [Trello for my GTD](https://0x5.uk/2020/09/15/effective-gtd-with-trello/) for many years, which worked really well, but I always knew with it being a SaaS that it would only be temporary. I didn't even object to paying for Trello given it was so useful. Sure enough Atlassian bought Trello and have been actively ***ruining*** it as a product by trying to turn it into Jira, one unwanted feature disaster at a time. This kind of experience leaves me highly suspicious of closed-source commercial software, particularly something I'll depend on day in day out.

## Q: What impressed you most?

A lot!

The perfectly normal and well implemented folder navigation in Obsidian was a breath of fresh air after the artificial constraint of Logseq with the frankly ridiculous idea that [Logseq "Namespaces"](https://docs.logseq.com/#/page/namespaces) are not actually just "folders" in disguise (they are separated with `parent/child` in the UI, but stored as `parent___child.md` on disk for some reason - that's a triple-underscore!!).

I was immediately able to tidy up some of the mess in my notes that I'd never practically been able to do in Logseq.

The desktop interface is nice looking, supports solarized colour themes, and is remarkably simple to use given how much functionality and configurability is hiding in there.

The tabs and pane splitting is really nicely done. I had been planning on doing pane-splitting in markdown-neuraxis and eschewing tabs (to keep cognitive load down for the user), but have changed my mind now — it's actually really useful having both. The tab pinning I'm not entirely sure about yet, it's cool and I've been using it to pin today's note plus the odd extra note, but is it one of those things that is actually just a distraction from the actual task at hand?

The biggest positive surprise has to be the android mobile app — Obsidian have done a stellar job on this, it loads pretty fast even with around 2,000 notes, even the original parsing isn't unbearable, so I can reasonably quickly capture things on the go at last. The design and interaction is nicely done, it feels similar enough to the desktop app, yet also fits in nicely with an android phone touchscreen. It's also especially nice that because Obsidian keeps all the plugins and settings in the `.obsidian` folder in the "vault" that the mobile app instantly gets the same config and plugins I'd taken time to set up on the linux desktop app. Neat!

Given my concerns about it being closed source, it is currently surprisingly restrained on the commercial side. It offers the [their own cloud hosted sync for a monthly fee](https://obsidian.md/sync), it's available in sensible places in the app but it is not too in-your-face or pushy, it's just there. Given I use syncthing I'd be annoyed if it was constantly nagging me to pay for something I have no need for.

## Q: What do you still miss from Logseq?

Number one has to be [Logseq's "block references"](https://itsfoss.com/logseq-pages-links-tags-blocks/#referencing-a-block). That's a really clever feature, and it's broken in all my imported notes. Being able to link to a specific bullet in another markdown file has been fab, and I think the way it is implemented by adding a simple `{GUID}` to the bullet which the UI knows to hide is very elegant, doesn't overly pollute the raw markdown, and could theoretically be read by any tool. The best part is that they didn't just put the guid in the db cache it creates, because if they did that then the block references would all be lost when only looking at the raw markdown. I might hunt around for an Obsidian plugin to retro-fit it, or maybe even get an LLM to make one. It's definitely on the feature list for markdown-neuraxis.

Logseq's outlining and deeply nested bullets are great. That is all sill there in Obsidian too, but because Logseq *only* had bullets, it caused me to really learn how to make better use of large deep bullet lists, and that's something I'll take with me to Obsidian and MdNX (mdnx is my pet abbreviation for markdown-neuraxis).

I almost never felt the need to look at the raw markdown when using logseq, the editor is very good. Moving to Obsidian there does seem to be a few subtle rough edges in the editing experience. It shows that the editable ["live preview" mode was added](https://retypeapp.github.io/obsidian/live-preview-update/) after "preview" and "source" views were already in place. Sometimes I do have to switch to source mode to get something right, which is a shame. I'm hoping that my editing model in markdown-neuraxis will end up at least as good as Logseq's is. I've put a lot of work into a line-based engine to support it, but it has taught me just how incredibly hard it is to make a reliable and fully featured live editor. Kudos to both Logseq & Obsidian for what they have achieved.

## Q: So why leave logseq?

As I mentioned, the final push was largely the DB-first move & the mobile app lag; but it was clear that Logseq would never evolve to be the notes app I want longer term, there are just far too many missing features and "interesting" design choices that don't work for me.

Specifically:

- Normal folders
- Support for all my notes in all their quirky markdown formatting (I have converted notes from Tomboy's xml format from as early as 2012 - I was never going to waste time trying to shoe-horn them into logseq's bullet-only format)
- Snappy capture on Android
- Possibility of brining the full GTD into my PKMS world

Even though Obsidian fails the FOSS test, there were still enough problems with Logseq to justify the move to Obsidian as an interim solution until I can find something FOSS that is a good enough replacement for me to dog-food with on my own PKMS.

## Q: What’s still missing for you in Obsidian?

A lot less than I expected for sure. But still enough for me to keep building markdown-neuraxis and keep an eye out for alternatives that might fit the brief.

Specifically:

### FOSS

The elephant in Obsidian's room.

If like me you truly believe that control over the software you run is critical (or increasingly "the software that runs *you*" these days), then if there is any possibility of a FOSS alternative then that's a key driver for moving on.

I have a similar fight that I'm currently losing very badly over mobile phone operating systems. You can read more about that in my ["why don't you just" section of my saga trying unsuccessfully to escape iOS/Android's duopoly](https://0x5.uk/2021/12/17/phone-setup-notes/#why-don-t-you-just). There's more writing in that piece on why the FOSS/Commercial battle matters so much in the modern day.

The fact Obsidian puts all notes and state into markdown and `.json` files on your local disk is fab for privacy and control, but it's still not FOSS software.

### "Block references"

In Logseq you can right click *any* bullet and get a "block reference", then paste that anywhere else in your notes.

This magically and invisibly puts a `{GUID}` in the source note that the UI hides, and the target note gets the same GUID and the UI magically shows the source bullet. This is frankly genius and something I really miss in Obsidian. Especially since my imported notes are full of them. Perhaps there's a plugin or something, but currently I lack such a thing. It's something I'd be keen to make work in markdown-neuraxis in some form somehow.

You can link to headings in other notes in Obsidian, which is a consolation prize, but it's not quite the same.

### Page Aliases

Aliases in Logseq and Obsidian just do work a bit differently. I'm not quite sure what to make of it yet, but I do miss the way Logseq let you link to an alias with `[[alias]]` which doesn't work in Obsidian (and is broken in my imported notes). On the flip side the automatic shortening with `[[path/to/page|page]]` in Obsidian *is* pretty tidy.

### Toggling checkbox presence

By default `Ctrl+L` in Obsidian toggles a checkbox state (checked/unchecked), and even adds a checkbox if there isn't one. But getting rid of it requires multiple backspaces and shows the raw markdown breaking the illusion of the live preview.

In Logseq the toggle was tri-state, including "no checkbox at all" as well as checked / unchecked. This is nicer.

Since I started writing this post I discovered you can get the same by reassigning `Ctrl+L` to "cycle checkbox" instead, which fixes this one. Hashtag yak!... `#yak`

### Flexible prefix states

Logseq supports the idea of having a bullet start with an all-caps state such as "TODO", "DOING" or "DONE"; which can be extended to more states like "WAITING" with [task management plugin](https://github.com/vipzhicheng/logseq-plugin-task-management-shortcuts). I really rather like this, especially with the shortcuts to quickly flip states.

When I first saw this I thought "that's weird, surely that would just clash or be hard to parse reliably", but actually it works really well in practice. Sometimes the simple ideas are the best.

This has the best of both for markdown

- it is readily parsable into something meaningful, and
- it reads really clearly in the raw markdown file, no cryptic format or codes to understand. WAITING means, well, "waiting". Simple!

I never got it to feed into some kind of GTD magic as I would have liked, but the concept is pretty neat and is something I potentially might want in future as I figure out how to use Obsidian/mdnx for GTD style task/life management.

## Q: Did Obsidian change how you feel about markdown-neuraxis?

Totally! My first reaction was: “Oh no!!!! Did I just waste 9 months building markdown-neuraxis?”

It was visceral, a very real and largely emotional knee-jerk response to seeing just how good Obsidian is on first interaction.

Having used Obsidian for a little while and got to know it a little better the initial emotion, strong as it was, passed fairly quickly.

The paper-cuts I've found in Obsidian so far are largely bearable, and maybe many could be improved with plugins (existing or by writing my own with Claude).

I can see now that although Obsidian is really very good, and I can see why people rave about it, I *do* still want a FOSS alternative; something I can really hone to fit my own view of PKMS + GTD ways of keeping life & work running smoothly without dropping anything on the floor. Something that isn't at such risk of enshittification.

As far as I know there is (perhaps surprisingly) nothing out there that fits my criteria of:

- markdown-first
- FOSS
- desktop + mobile
- PKMS wiki support
- GTD style task management support
- stable & mature enough for daily use

So yeah, after the initial bump, I am still convinced that creating mdnx is worth the effort.

## Q: Would you recommend other Logseq users switch to Obsidian?

That depends on what you want out of a tool like Logseq.

The possible use cases for tools like Logseq, Obsidian and markdown-neuraxis are endless, with all sorts of more-or-less overlapping needs.

If you really value local markdown files as the source of truth, and closed-source isn't a deal-breaker, then I'd definitely recommend giving Obsidian a look; especially with the recent move to db-first.

However I gather some people get a lot of benefit from being able to run complex datalog queries on the Logseq "blocks" (i.e. bullets), and perhaps nothing else will meet that need for now.

If the pain of lacking a good mobile option for Logseq is sufficient for you then that might be enough reason alone to look for alternatives. It was certainly a big motivator for me to use Obsidian as an interim and not stick with Logseq till I had mdnx ready for dogfooding.

I switched because of what I needed out of a tool. Rather than leading with a recommendation, I would first ask: "what do you want from your tools?", and only then see what tools would meet those needs.

## Final thoughts

I am extremely grateful that both Logseq and Obsidian exist in the world. They are both incredible tools and clearly the result of an enormous amount of hard work. I am glad to be able to benefit from and learn from both.

There is a synergy between methodology and tools. The PKMS, Zettlekasten, GTD & PARA methodology movements have a lot to teach; and equally, tools like Obsidian & Logseq, (and maybe one day markdown-neuraxis) provide a space to exercise and experiment with methodology, and can help guide us in its application.

Logseq has been of huge benefit to me over the last couple of years, and for that I am thankful.

Obsidian has surprised me with what it has to offer, and by using it for real for my daily note taking it is helping me understand the problem space much more clearly, but it is still for me a temporary stepping stone to something more, something FOSS; some perfect amalgamation of all capabilities, platforms and methodologies, traded off with simplicity and useability.

I'll keep building markdown-neuraxis, and would love to hear from anyone who is of similar mind.

Thanks for listening!

Till next time.
