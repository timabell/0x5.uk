---
title: Choosing a programming language for timslist
layout: post
---

I'm working on a new thing, [timslist.uk](https://timslist.uk/), and of course with the first thing out the way (a domain), the second thing is the choice of programming language. Excuse me, I'll be back in a few years with an answer.

I primarily want something that I can keep hosting costs low as possible while it has no income, for as long as possible, something that doesn't become an unmaintainable nightmare, and something that I would be able to get decent programmers to work on in the future without creating a new unmaintainable mess.

The hypothesis is that I can hack away on the side, build something that compiles to web assembly for sharing logic with front-end, use manifests to make it installable on mobile until I can justify full mobile apps (which are *very* high maintenance thanks to the api & app store churn) and have infinite runway while I figure out what works thanks to the consulting.

## Golang or Rust?

Currently I'm considering golang and rust, which are both languages that would give me the ability to serve vast user numbers with relatively low costs. (I can dream right? Maybe I'll even succeed...)

### Golang

I wrote [schema explorer](https://github.com/timabell/schema-explorer) in golang which was educational. I still appreciate the simplicity of the language, and having worked on C# 2.0 that was still simple I appreciate the value of being able to pick up anyone's code and refactor it into shape, something no longer possible in the sprawling language that is C# 10 or whatever they've got to now. On the other hand I was left with the feeling that abstractions would be less high-level resulting in more code to wrangle for the same amount of functionality; something I can ill afford as a lone programmer at this stage.

### Rust

[Rust has been the most loved language for 7 years in a row](https://survey.stackoverflow.co/2022/#overview) which must mean something, right? It is low level and fast, but it also doesn't shy away from high-level abstractions that I appreciate as a programmer. To give myself a better idea as to what it's like to work in I've been working on [gitopolis](https://github.com/timabell/gitopolis/), this has helped me get beyond the (excellent) docs. So far it's, erm, hard!

I want to enjoy this project, and I also want it to be written in something that attracts great coders for many years just in case this is successful. The kind of coders that are more than just writers of reams of mediocre code. Ruby has seen a rise and fall of this crowd as the basecamp induced excitement faded and the kool kikds moved to the next big thing, probably something with types or functional programming. C# has a vast army of not-very-good programmers (who create endless projects for me to improve at work). It's hard to tell where golang and rust fit in these curves.

In case anyone wonders, I'm happy to carry on consulting in C# land and hack on other things outside of client time.

[Endler's article on go vs rust](https://endler.dev/2017/go-vs-rust/) makes me think I will *enjoy* building in rust more, which is important for a project that I plan to be solo on for a long time, and have to want to work on it day in day out regardless of the challenges of life to stand a chance of success

My main worry with rust (and to a lesser extent golang) is the incompleteness of libraries, frameworks and integrations; leading to endless toil and dead ends that I just don't have the engineering resources to contend with

[Loris Cro's piece on choosing golang over rust for the enterprise](https://kristoff.it/blog/why-go-and-not-rust/) is very compelling and I think probably has the argument that I've been looking for to persuade me that I should choose GoLang rather than Rust for timslist. I'm looking for something that will do engineering at scale in the long run while keeping hosting and programmer costs down.

## Research

* This is a must read on golang and rust: <https://bitfieldconsulting.com/golang/rust-vs-go>
* <https://endler.dev/2017/go-vs-rust/> this one makes me think that perhaps using the hard road of rust would give me some opportunities for hard-to-copy features in future (such as responsiveness, stability)
* <https://kristoff.it/blog/why-go-and-not-rust/> - a very persuasive and level-headed article article that explains the tradeoff in terms of real enterprise development (something I'm painfully familiar with).

---

to be continued when I have decided