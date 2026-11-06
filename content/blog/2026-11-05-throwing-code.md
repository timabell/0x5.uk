---
path: /2026/11/05/throwing-code/
title: "Throwing Code"
---

I was journalling on my [supernote](https://supernote.com/) eink the other morning and contemplating what it's like "writing" code these days with the advent of the LLMs, and I have a new term for it.

"Throwing Code"

There have been lots of neologisms around coding with LLMs lately -

- vibe coding
- slop coding
- meat proxy
- software factories
- dark factories
- clanker

Most of it is pejorative, and understandably given how crap some of the output can be; even the output of the latest, greatest and most planet-incinerating models can be pretty shocking - though they usually produce code that is convincingly good on first sight, and increasingly full of problems in the detail and architecture the longer you stare at it.

And yes, I might just be holding it wrong.

There are some interesting changes in what it is "like" to "code" these days. It is definitely true that it is now possible to produce large volumes of code with very little input effort; especially for things like creating half-decent test coverage in the style you want that you can explain to the LLM. A lot of the toil has been removed. It has also been replaced by a huge burden of review - "the bottleneck has moved" as someone said.

But with all that—which has been fairly well discussed now (reddit's [r/ExperiencedDevs](https://www.reddit.com/r/ExperiencedDevs/) is good for reading the zeitgeist)—there is something else in the properties of coding that has changed, and I have been searching around for a way to convey it.

> "started to feel more like moulding"

I have thought for a little while now that creating (no longer "writing") a small program, new test suite, or medium-sized iteration on an existing system has started to *feel* more like "**moulding**" (molding if you are USA).


You tell claude what you want, and within seconds it spits out several thousand lines of code, that are (these days) of reasonable quality in the small, but usually quite a long way off in intent, architecture, style etc.

Then you actually have to read and understand what it produced (unless you are one of these dark-factory people). And in my experience I usually find several things where it was a reasonable first attempt given the context, but that I have many corrections to approach and style that I wish to apply to the generated code.

In the before-days (like, all that time ago back in Spring 2025, which seems a lifetime ago now in coding), if someone produced a patch which was a couple of thousand lines long, where it had missed the point, or was written in the wrong style, it would have been a considerable **toil** to go through it and rewrite it by hand to be in desired style (for example needing to replace raw XUnit "Assert" statements with the much nicer "AwesomeAssertions" in several hundred tests). The refactoring tools were good—god bless you JetBrains and everything you have done for us—but they were always very limited to a specific set of "refactorings" that had been carefully programmed in.

But ***now***… in the Autumn of 2026… it feels like we have the *ultimate* refactoring tool. Any change in shape, style, approach, functionality that you want - just prompt again. You can be incredibly brief, and express in [grunts of basic English](https://github.com/JuliusBrussee/caveman) how you want it changed, and within another minute or two, many thousands of lines of code and tests can be completely rewritten in a completely different style. And for all it's *many*... *maaaannnnny* faults, claude code's Opus is actually very damn good at doing these changes with a pretty high degree of accuracy and comprehension.

It is still not single shot, even with extensive guidance in "AGENTS.md" or whatever, and the "adversarial review" by agents helps, but it absolutely does *not* replace experienced engineer judgement (for the same reason you can't have an engineer with 20+ years of experience just "tell" a junior engineer how to engineer like they have 20 years of experience too). But it's good. It's useful. It's faster for sure. It's slippery as hell and if you take your critical eye of it then it will absolutely slip a clanger past you. All the good engineering we spent the last decades learning the hard way are even more important now - tests, review, patterns, code quality, maintainability, operability and on and on - it all improves the output even when LLM-assisted, and it all helps limit the damage an LLM can do.

---

I have to mention at this point that I suspect that those who are claiming success with their software factories are not in the slightest bit just closing their eyes, trusting the LLM and vibing. In fact I suspect that they are working *incredibly hard* at creating and iterating on harnesses, guidance, checks, cross-checks, guidance for multiple AI reviews of AI generated code, automated checks and test harnesses that the AI can use, and on and on, such that—for a specific project or style of project—with enough token spend (which may or may not prove sustainable financially) they *really can* get a high-quality and long-term maintainable output [for their todo app… oops, sorry! couldn't resist that jab, I am sure there are lots of worthwhile projects too, and there is nothing wrong with trying out the latest tools of the trade by writing a todo app with a userbase of one, christ I spent 3 years writing a database tool that apparently only I use, partly to learn golang].

---

So the feeling has *changed*.

We use many expressive words in programming when talking to other programmers, often using colourful langauge to describe codebases (like: clean, tidy, nice to work with, leaky abstractions, over-engineered, F*****G sh*it, smelly, legacy, outdated, incomprehensible spaghetti, and on and on). And the actual work of programming has words too - flow, joy, toil, hell. In fact I published a piece on [the "pain" of reading bad code](/2025/01/31/why-is-reading-bad-code-so-painful/) because it had been puzzling me why I get these feelings.

> the feeling has *changed*.

So what to call the new feeling of moulding code so easily, where it once was toil.

I sat writing random phrases around this thought. I had had the idea that it had become like moulding clay for a while now, just from the lived experience. But it didn't really seem like the right words. So I kept playing with the ceramics metaphor - and then a connection flashed into my mind - "throwing", it's an odd phrase, but when potters turn clay into a pot on a potters wheel, it is called "throwing a pot". Goodness knows why, but it's quite a pleasing phrase in its own way. So "Throwing code" popped into my head all by itself - just replacing "pot" with "code". And I bloomin love it.

> "'**Throwing code**': the act of taking a raw lump of code generated by an LLM, and progressively observing and shaping it into the desired shape and quality"
>
> ~ Tim Abell (me), Nov 2026

The parallels are striking. You can get a pot into a rough pot shape from a lump of clay very quickly (with enough experience). And likewise you can get what on the face of it is a good resemblance of a complete finished product in code from a few LLM prompts (hello vibe coders). But to create a work of art from clay on the potters wheel? Not nearly so quick, many rounds of observe and adjust, making ever finer adjustments to achieve the desired result. And the same goes for the gap between vibe coded output and a quality software system that will be maintainable, performant, and [high quality](https://en.wikipedia.org/wiki/Zen_and_the_Art_of_Motorcycle_Maintenance) (i.e. few bugs) - considerably more time and experience is required to shape the code to that point, *even* with the help of a capable LLM.

And since I first wrote this, I have an answer to why it's called "throwing" in pottery/ceramics:

> "It’s called throwing because you have to throw the clay at the wheel head to make it stick before you can start."
>
> ~ Sarah Abell - [sarahabell.me](https://sarahabell.me/)

So there we go.

You can call it throwing code now.

It probably won't catch on.

Or maybe I didn't invent it, and someone else beat me to it. Which is fine by me. By all means let me know and I'll link to it. I haven't researched it because I wanted to keep my own thinking pure. I haven't even used and LLM for this post, I think I prefer my own writing that would make an editor's eyes bleed. And those em-dashes - I copy pasted them by hand (no idea how to type them on a laptop), because thanks to the LLM slop I have actually learned what they are for and have a new tool in my writing toolbox. It's funny how I notice them in all the books I'm reading - even really old books like "the wishing chair" are full of them - and yet I had never really noticed that there was an entire ascii code I had never thought to use, or even realised that I didn't know about. But hey I'm rambling now. Which I can. Because it's my blog. Or bliki. Or whatever. And it's late, so my brain is off in strange directions.

If you want to hear me announce the idea on video, that's [over here on youtube](https://www.youtube.com/watch?v=W3bLf_0jkp4) or [on instagram](https://www.instagram.com/p/DfUjLTONRuF/) (shudder), because I am making more of an effort to actually get my ideas and creations out there instead of just pouring my heart into the digital bit-bucket of my laptop to never be seen again. Subscribing to the youtube and/or this blog, and following on the "insta" would be appreciated just so I know you are here. Or better still drop me an email and say hi and move past the parasocial.

Okay, I'm really wasting your time now I think, I can't believe you're still reading at this point.

You can go now.

Honestly, this probably wasn't worth your time.

But thanks anyway, I'm truly grateful!

Good night. Or good morning. Or good evening. Either way, till next time! Stay in touch. Be human. Beware of the infinite-scroll.

~ Tim ~
