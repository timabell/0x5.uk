---
title: Choosing a programming language for timslist
layout: post
---

I'm working on a new thing, [timslist.uk](https://timslist.uk/), and of course with the first thing out the way (a domain), the second thing is the choice of programming language. Excuse me, I'll be back in a few years with an answer.

## Goals

I primarily want something that I can keep hosting costs low as possible while it has no income, for as long as possible, something that doesn't become an unmaintainable nightmare, and something that I would be able to get decent programmers to work on in the future without creating a new unmaintainable mess.

## Hypothesis

The hypothesis is that I can hack away on the side, build something that compiles to web assembly for sharing logic with front-end, use manifests to make it installable on mobile until I can justify full mobile apps (which are *very* high maintenance thanks to the api & app store churn) and have infinite runway while I figure out what works thanks to the consulting.

## The big question, GoLang or Rust?

Currently I'm considering GoLang and Rust, which are both languages that would give me the ability to serve vast user numbers with relatively low costs. (I can dream right? Maybe I'll even succeed...)

I'm giving this *a lot* of thought because should I succeed then this is probably one of the hardest things to change amidst the chaos of a runaway startup; and the choice has very real consequences.

(P.s. In case anyone wonders, I'm happy to carry on consulting in C# land and hack on other things outside of client time.)

## What do I want out of a language?

1. Something I'll enjoy working on in the short to medium term while it's just me building it.
2. Something that would allow me to attract great collaborative coders (not rock stars) to work on it with or for me later on when I can show revenue.
3. Something that will keep hosting costs as low as possible to maximize my pre-revenue ability to scale the user base while supporting it with contracting.
4. Something I can run server and client side (with WASM) to avoid duplication of code that I can ill afford.
5. Something that allows me to build up advanced abstractions that allow me to operate and pivot without re-writing reams of code..
6. Something that has enough good quality library support that I'm not going to drown in unfinished or missing dependencies.
7. Ideally something that might allow me to build some unique technical advantages over the competition.

### GoLang

I wrote [schema explorer](https://github.com/timabell/schema-explorer) in GoLang which was educational. I still appreciate the simplicity of the language, and having worked on C# 2.0 that was still simple I appreciate the value of being able to pick up anyone's code and refactor it into shape, something no longer possible in the sprawling language that is C# 10 or whatever they've got to now. On the other hand I was left with the feeling that abstractions would be less high-level resulting in more code to wrangle for the same amount of functionality; something I can ill afford as a lone programmer at this stage.

### Rust

[Rust has been the most loved language for 7 years in a row](https://survey.stackoverflow.co/2022/#overview) which must mean something, right? It is low level and fast, but it also doesn't shy away from high-level abstractions that I appreciate as a programmer. To give myself a better idea as to what it's like to work in I've been working on [gitopolis](https://github.com/timabell/gitopolis/), this has helped me get beyond the (excellent) docs. So far it's, erm, hard!

I want to enjoy this project, and I also want it to be written in something that attracts great coders for many years just in case this is successful. The kind of coders that are more than just writers of reams of mediocre code.

My main worry with Rust (and to a lesser extent GoLang) is the incompleteness of libraries, frameworks and integrations; leading to endless toil and dead ends that I just don't have the engineering resources to contend with.

#### Popularity curves & engineering talent

Ruby has seen a rise and fall in popularity with the best coders as the basecamp-induced excitement faded and the kool kids moved to the next big thing, probably something with types or functional programming.

C# has a vast army of not-very-good programmers (who create endless projects for me to improve at work).

It's hard to tell where GoLang and Rust fit in these curves.

I suspect GoLang is likely to bore the better coders in the end, and although it will prevent the less good coders hurting themselves quite so badly I'm not sure I want that crowd.

Rust is definitely a sharper and harder to use tool, which is the kind of thing that attracts the hot talent. But equally, when they get bored of the challenge they move on like locusts to the next hot thing, leaving the businesses that chose Rust behind with a dearth of talented people to work on their existing code.

I can't tell if Rust will buck that trend and be sustainably cool, or if the cool coders will all head off to the next big thing by the time I have need of many engineers.

I'm also worried that Rust will attract the C++ over-engineering crowd who will write incredible code that no-one else can comprehend while the business goes out of business due to not shipping anything users actually care about. (Sometimes called "write-only code"!)

### Articles of persuasion

[Endler's article on GoLang vs Rust](https://endler.dev/2017/go-vs-rust/) makes me think I will *enjoy* building in Rust more, which is important for a project that I plan to be solo on for a long time, and have to want to work on it day in day out regardless of the challenges of life to stand a chance of success

[Loris Cro's piece on choosing GoLang over Rust for the enterprise](https://kristoff.it/blog/why-go-and-not-rust/) is very compelling and I think probably has the argument that I've been looking for to persuade me that I should choose GoLang rather than Rust for timslist. I'm looking for something that will do engineering at scale in the long run while keeping hosting and programmer costs down.

Completely opposing this, and also very compelling is the story of [Why Discord is switching from Go to Rust](https://discord.com/blog/why-discord-is-switching-from-go-to-rust), where they show their massively improved metrics thanks to a rewrite of a GoLang microservice into Rust, along with assertions from experience of being able to keep engineering (relatively) small, and iterate fast. They say they are using Rust extensively in production which is reason for confidence in it as a choice as Discord probably has far more demanding needs than timslist would have any time in the next 20 years if it took off like a rocket.

[Early Impressions of Go From a Rust Programmer](https://betterprogramming.pub/early-impressions-of-go-from-a-rust-programmer-f4fd1074c410?gi=4ae004f7c897) is interesting because on the one hand it pretty much all points towards GoLang being the right answer (I happen to like the use of upper/lower case for public/private), however towards the end it shows some things that are missing that might make it harder to ever use higher level abstactions, and it notes the fact that nil-pointer de-refs are still a runtime failure in GoLang.

## Articles on Rust versus GoLang

* This is a must read on GoLang and Rust: <https://bitfieldconsulting.com/golang/rust-vs-go>
* <https://endler.dev/2017/go-vs-rust/> this one makes me think that perhaps using the hard road of Rust would give me some opportunities for hard-to-copy features in future (such as responsiveness, stability)
	* <https://news.ycombinator.com/item?id=15266066> interesting discussion of the endler post
* <https://kristoff.it/blog/why-go-and-not-rust/> - a very persuasive and level-headed article article that explains the tradeoff in terms of real enterprise development (something I'm painfully familiar with).
* <https://codeburst.io/should-i-rust-or-should-i-go-59a298e00ea9?gi=8338640ecce8> - mentions that Rust can be made hard to read by other devs, an important point.
* [Why Discord is switching from Go to Rust](https://discord.com/blog/why-discord-is-switching-from-go-to-rust) - powerful article on how much better Rust is than GoLang for making the best use of server resources and providing low-latency high-throughput capabilities, with no GC related spikes in latency. A strong argument for Rust over GoLang.
* <https://blog.boot.dev/rust/concurrency-in-rust-can-it-stack-up-against-gos-goroutines/> compares concurrency and parallelism in Rust and GoLang in a short and enlightening style with some useful code samples. I think the differences are less important to the decision than the other factors above, clearly both can solve the problems as needed.
* <https://softwareengineering.stackexchange.com/questions/247298/how-are-rust-traits-different-from-go-interfaces> - dynamic and static dispatch

## Assimilating the tradeoffs

The pros and cons that are relevant to what I'm trying to do:

### In favour of GoLang

* Maintainable as more programmers added to team of varying quality and opinion (inevitable in the long run I think).
* Highly performant programs.
* Fast compile times on big codebases.
* I like the test library style (minimal, uncontrived, use real code to write tests).
* Has generics at last.
* Easy multi-threading (not sure I need this particularly).
* GC (easier than worrying about Rust's ideas).
* Continues to be used internally at google at scale so likely to be supported for a loooong time.
* Stated mission to remain a small language.
  * Having watched C# go from being a truly knowable and useful language in 2.0 to being a sprawling mess with syntactic-sugar-itis in [C# 11](https://docs.microsoft.com/en-us/dotnet/csharp/whats-new/csharp-11), a state that makes it increasingly hard to work with the code of others and work well together in teams, I have no desire to set my own startup up for that fate.
* I'm guessing the ecosystem of libraries & frameworks for writing web things has matured since I last looked and is (I'm guessing) ahead of the Rust ecosystem.
* Explicit handling of errors by return (but also has panic available for burn-it-all-down errors, which can be caught).

### Against GoLang

* Error handling boilerplate.
* Module system is a bit confusing (perhaps they have it right and easy now?)
* Unknown future direction (do we know the future of any language really?)
* Code ends up quite verbose - volume of code can cause resistance to change.
* Dull, so might not be able to retain great coders in the long run as the zeitgeist moves on to hip'er pastures.
* No pattern matching coolness. I don't know if I'm just overexcited about discovering this way of coding or if it's actually important. No doubt I'll gain more perspective with practice.
* [Why Go Is Not Good by Will Yager](https://yager.io/programming/go.html)

### In favour of Rust

* Highly performant programs.
* Immutable by default (this is huge!)
* No null-ref errors (hooray!)
* Intersting new toy to learn.
* Potentially able to make higher level clean abstractions than in go.
* Created by Mozilla who we love.
* Owned and run by the independent [Rust Foundation](https://foundation.rust-lang.org/), so perhaps free from the dubious influence of commercial interests. (Though people don't ignore those that pay them).
* "Most loved language", but what does that mean? Possibly easier to attract talent that want to work in Rust? But will they be the right kind of talent? And how long will that last?
* No runtime means smaller WASM files I think, and there seems to be [lots of ways to optimise wasm file size in Rust](https://rustwasm.github.io/book/reference/code-size.html)

### Against Rust

* Harder to learn.
* Takes longer to write a single piece of functionality up front.
* Unknown future direction.
* The [Rust foundation is new](https://foundation.rust-lang.org/news/2021-02-08-hello-world/), and unproven in ability to maintain the language over the long term.
* I heard that there may be issues with the completeness and maintenance of libraries ("crates") in the Rust ecosystem, this is of particular concern when it comes to security issues. Perhaps this will improve, or perhaps I am misled. Every ecosystem has its security issues, it's a tough world out there at the moment no matter your platform.
* I clearly don't know what I'm doing yet, given how long it's taking me to build gitopolis.
* "Fighting the borrow checker" (perhaps a worthy price for eliminating whole classes of programming error at compile time).
* Perhaps a more limited pool of Rust programmers availale than GoLang programmers. If all I can find is a few relevant coders it's going to be harder to filter for other traits such as not-being-an-asshole, or communication skills.
* Layers and layers of boilerplate error/match handlers (or so I heard). Not sure if this is an issue yet, I need to get more experience to judge.
* Language for C++ coders, not people who want to build simple business value fast. Might encourage over-engineering for what should be straight-forward simple solutions to simple business needs.
* Complex language with many ways to solve problems, that might result in it being harder to maintain as programmers and styles come and go.

## What now?

I need to sleep on all this research, and spend some more time building gitopolis with all this in mind.

Currently there's a bit of me that thinks I "should" use GoLang as the "boring" option that would result in minimal drama, but my heart is definitely pullled towards Rust right now, and that's important because I have to actually want to work on this thing.

To be continued ...
