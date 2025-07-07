---
title: "Why do automated tests matter?"
layout: post
reddit: https://www.reddit.com/user/timabell/comments/1boqn5c/why_do_automated_tests_matter_tim_abell/
---

It might seem a bit odd to write a post on software tests after so many years and so much content, yet to this day I see well meaning developers writing software without adequate test coverage. In fact I will share that I myself have been _very_ late to enlightenment on this front. Sure I've been "writing tests" for well over a decade, but I was missing the mental framework that would make those efforts coherent, complete and effective.

In my view the mental model of why we would write tests is more important than the detailed "how" of writing unit/integration tests, because without that it can only be at best haphazard whether the testing really serves its true purpose.

I'll share with you here the keystone ideas that make it all sit together properly, just like the keystone in a stone archway. Then from there, all the tests you write will sit in their true and proper place within that framework, or be obviously either waste or missing.

👉 🎙️ This topic is [also covered on my podcast](https://pod.timwise.co.uk/25) 🎙️

![Photo: the shard through a brick archway](/images/blog/archway_IMG_20231109_135436.jpg)

Yes I'm aware this particular archway in the photo doesn't actually have a keystone, but I took the pic and I rather like it so it's staying.

## The Before Time: TDD & Unit Testing

I started my career in software development way back in 2000 when only a few very forward thinking people were doing high quality automated testing, and it really hadn't reached the broader consciousness off the software development community.

Like a large number of software devs of that era, I became aware of "software testing" through the "TDD" movement (test-driven development). I believe a lot of the noise about this came out of the Ruby on Rails community (no coincidence, there's no compile step so there's more reliance on good tests in ruby/rails than in compiled languages). My experience of this was that it was largely talked about and taught as a bottom-up approach to testing:

1. "Here's how you write a unit test for a class."
2. "Here's how you do assertions."
3. "Here's why you should write the test before the code (red-green-refactor)."
4. And in C# land "here's how you do dependency injection".

This is all good and important to know but is not enough in itself.

This was also a time when SOLID was big in the OO consciousness, so classes, isolation, encapsulation and all the small pieces of the machine you were building was the focus, and testing those pieces was often enough to claim you were "doing testing". Interviews often being more about "do you TDD" than "will your system break for end users".

"Integration Testing" (i.e testing more than one piece together) was certainly in my awareness, but mostly as a TDD++, and was usually missing any kind of coherent "why". You might test some code with a real database instead of a mocked persistence layer, or check that all your pure code classes didn't blow up when they were wired back together. In C# world a lot of mental overhead was created by trying to work out how to test code that used Microsoft's not very test-friendly .NET Framework standard library code.

So I bumbled along, more or less successfully writing tests for my software, but always feeling like I didn't have a really solid argument for the big picture. For me it was mostly "aim for 100% test coverage" and you'll catch/prevent lots of bugs, plus it was good at driving software architecture in the minutia by preventing things being too coupled together.

More recently I've had the pleasure on working with people who are super-keen on "outside-in" testing and considerably less keen on acres of unit tests, and it finally dawned on me what I've been missing all these years. What follows is the missing piece:

## The "Why" of Testing

So let's take a step back for a moment. Why do we write tests at all, what is the big goal that makes this all worthwhile.

There's long been discussions of the "cost/benefit" of tests, and there is research that shows [teams that write tests are more productive](https://en.wikipedia.org/wiki/Test-driven_development#Benefits), which is good, but a bit abstract when it comes to what we actually need to write to be effective.

### Preventing Regressions

The goal of writing any software is working software for users and businesses; and they aren't going to be too happy when something that worked fine on Monday is now broken on Tuesday.

I don't think it's news to anyone that the goal of software tests is to prevent regressions.

### Axioms

There are two pieces of the testing puzzle that "preventing regressions" alone didn't make immediately clear to me, and these are they key reasons I'm taking the time to write this post at all. They drive a subtle but foundational shift in what our writing of tests actually looks like and the magnitude of their effectiveness.

They may seem trivial and obvious at first sight, but do not ignore them so quickly as they are the axioms upon which the whole approach rests. They are:

1. What matters is not whether your class has "tests" but whether the software as perceived by the user does the job they need.
2. When you add your _first_ feature it's easy to manually verify it's behaviour. When you write your _ninety-ninth_ feature you still want to be _certain_ that the other ninety-eight features are _all_ still intact.

Most systems have many thousands of "features", especially if you include "non-functional" cross-cutting requirements such as acceptable performance for each capability.

## Full, Automated Coverage

Every time you touch your software, there is a non-zero risk that something that used to work will no longer work. Anyone who's written software for any length of time will laugh at the idea that "a change in component A has no possibility of breaking something unrelated in component B". And as a more rigorous colleague pointed out, we have problem of "emergence" in complex systems which makes it increasingly hard to predict behaviour. A good measure of your tests is how afraid you are of upgrading third-party dependencies, running you tests and immediately shipping the result without further manual verification.

The only sustainable solution to the presented axioms combined with the need to add more features over time is:

1. Ensure _every_ feature the user cares about has a test.
2. The software is tested from the perspective of the user.
3. The software is tested after every change.
4. This testing is fully automated.

### Insufficient Test Automation

If you write insufficient automated tests there are only two things that can happen, both bad:

1. You spend exponentially more time manually verifying all expected behaviour before any change is passed on for the user to use; bugs get through anyway. Or
2. You give up trying to test what was supposed to work, and some of it stops working.

Full automated test coverage of *all* delivered features to date is the *only* solution to this problem. Any shortcoming in this coverage is a subclass of the generalized "[technical debt](https://charmconsulting.co.uk/2020/11/27/leaders-guide-to-technical-debt/)" problem that quickly results in a catastrophic drop-off of ability to delivery anything at all if it is allowed to grow:

[![Graph delivery speed plummeting as tech debt piles up](https://charmconsulting.co.uk/assets/blog/graph-debt-vs-delivery.png)](https://charmconsulting.co.uk/2020/11/27/leaders-guide-to-technical-debt/)

## What Kind of Tests

So, if you accept all of the above, what does that mean when you actually fire up your editor and wonder what test to write?

You already write unit tests, that's enough, right? ... Bzzzzt, Wrong! That fails the "from the user perspective" need.

If the only thing that matters is that a feature works _from the users perspective_ then the only automated test that matters is one that tests a feature from the users perspective. In practice that means things like:

- End to end tests
- Browser automation
- Smoke tests
- Platform tests
- Performance tests
- Outside-in tests

And what doesn't matter a hoot is things like unit tests, integration tests and component tests, i.e. the very things that we were taught in "TDD school", and then left to figure out "the real world" on our own. (I'm not bitter, just wish I'd figured this out 20 years earlier).

### Pushing Tests Down the Pyramid

In an ideal world these fully-integrated end-to-end tests of entire features from the user's perspective would run instantly and reliably on the developer's machine the moment the code was written to disk, and we could have vast numbers of them at no extra cost of effort or speed. Here in the real world as we know from bitter experience, the most valuable tests are also the most troublesome. They are the slowest, most fragile, most prone to flap, they have the most difficult dependencies to unpick, and are the most subject to the combinatorial explosion in numbers as soon as there's a few possible code paths to take or inputs to handle.

Therefore as a matter of pragmatism we are forced to push some of our testing down the testing pyramid towards component, integration and unit tests.

If we do not lose sight of the highest goal of software testing, then this practically turns out to be be fine, and we can continuously tune the balance between the layers.

If however we do lose sight, and retreat into the lower levels of testing because it's hard or slow to create the necessary full system coverage, then we start to slide up the technical debt scale, and will pay the price sooner than we'd like.

### On Business Driven Development (BDD)

This is one that went off the rails as a concept. I see so many teams entirely miss the point of this movement, which is conceptually a good thing, but: IT'S NOT ABOUT GHERKIN SYNTAX, AND IT'S NOT ABOUT BROWSER AUTOMATION. Teams constantly get the technology confused with the intent and cargo-cult their way to an unholy mess of low quality high volume waste.

It's actually about writing down what the users expect of your software, in terms they'd understand, and making sure that those expectations are never broken unintentionally, which is actually a very good thing.

BDD ends up using gherkin and browser automation because gherkin allows plain English explanations that can be turned into executable tests, and users often interact with software via a browser these days.

Gherkin (specflow etc) and browser automation test frameworks are tools for achieving BDD, not the definition of BDD.

Sadly by its nature the gherkin tools end up requiring maintenance of "step definitions" which is a hard cost to bear unless you are very careful what you use it for.

### Outside-In Testing

Outside-In testing is a term and concept that I came across recently that really aligns with what I have laid out here. It emphasises what the user experiences (even if it's an API user rather than a web user).

I think once the concepts in this blog post are internalised, then outside-in is a good shorthand for a good approach to achieving the regression testing goals that have been laid out in this post.

These are a couple of good posts on the concept:

- <https://thoughtbot.com/blog/testing-from-the-outsidein>
- <https://www.obeythetestinggoat.com/book/chapter_outside_in.html>

## Mindset and Culture

In the end, whether the right sort of automated regression tests are written comes down to the core beliefs of your individual engineers writing the systems and the teams they operate in.

If there is _any_ part of them then that isn't 110% on-board with what I've written here, then test coverage ends up being haphazard and incomplete, and over time gets steadily less able to prevent regressions.

If there is not a full belief in the need for high quality automated testing then even a small friction in the way (e.g. a difficult 3rd party dependency, or the need for complex multi-team multi-service regression test), then teams will generally quietly give up on full feature coverage from the user's perspective and satisfy themselves with unit or component level tests. Unhelpfully, to the untrained eye a large quantity of tests looks similar to "good coverage", and its less obvious whether it actually tests anything users care about. We must be constantly vigilant for this as the message on this is still relatively weak in the industry, and often confused by the (valuable) talk of detailed test approaches.

### Hero culture

If you are particularly unlucky, or have set up perverse incentives, you risk a harder problem to resolve which is the embedding of a self-perpetuating "[hero culture](https://scalablehuman.com/2023/10/19/the-dangers-of-hero-culture-in-development-teams/)" whereby engineers take the fastest path to delivering _percieved_ value (whilst incurring significant technical debt and unseen bugs), and then take credit again by rushing to highly visibly fixing the problems that they themselves created.

Good regression coverage, like much good engineering, takes time to build in the short term for a payoff of peace, reliability and sustained velocity in the long term. Which is incompatible with hero-ing it.

Beware the "rock star" programmer.

### Programmer Excuses

#### "I don't have time"

The client/boss is paying for your time, and the boss/client would like the long term benefits, mkay?

#### "The boss/client/manager won't let me"

The "should I do a good job" question, as I like to call it.

> "Which is quicker? Do that one."  
> ~ Your client / boss

I often see all but the most experienced software engineers falling into the trap of confusing authority with expertise.

I often hear engineers complaining that "they aren't given the time" to write tests, or do a proper job on some aspect of the software they are writing.

In reality what has always happened is the engineer has presented two options to a client/employer who doesn't know or care about how software is built:

1. I can do this feature properly with all the tests and great architecture etc etc (client glazes over) it'll be amazing, or
2. I can just do the feature without any of that proper stuff. Which one do you want?

The client / boss / project manager responds [whilst thinking "I have no idea what you are talking about, or why you are asking] "Which is quicker? Do that one."

Then the engineer gets the hump that they can't do a good job.

Or worse, the engineer assumed the answer for them without even asking.

Put it this way, if a plumber came to a house, should they ask the homeowner whether to earth the pipes, or should they just do it as part of the cost of the job. The homeowner might not understand why that's part of the job, but they probably also don't want to be electrocuted by the radiator.

It is perfectly reasonable for an experienced software engineer, who is the expert in _their_ trade, to just include automated regression tests as part of the job of feature delivery. To **not even bring it up in conversation**. The client/employer NEVER wants to pay for a feature, think its done, only to have it break again four features later. From their point of view, and quite rightly, that's just shoddy software.

This is not to say I'm secretive - I work in the open and am open to people asking why things are done the way they they are, and am happy to explain to the client why it's in their best interest. But whether it happens is not up for discussion.

## Hiring a QA team - Just Don't

Some organisations seem to think the answer is to take the regression test problem off developer's plates by hiring less skilled individuals to do this apparently mundane work. Some even hire SDETs to write automated tests for the developers.

This is a fundamentally flawed approach in the same way that hiring an Operations teams as a separate function was accepted as a bad idea and replaced with an integrated DevOps product team. (Well, apart from the anti-pattern of a "DevOps" role, but that's another post).

It's flawed in at least the following ways:

1. It embeds the "manual testing is okay" approach in the culture, but adds some extra brute force people-power in the hope that this will prevent the eventual arrival of the 99th-feature problem. (The number just gets bigger, it's still there). This is pretty much like trying to outrun your own shadow.
2. It encourages developers to consider testing (automated or otherwise) "that other team/role's problem".
3. It adds significant delays and an additional silo between writing code and delivering value to users and getting valuable feedback. Lengthening feedback cycles. This goes against _everything_ we have learned from toyota/kanban/lean etc.
4. QA people _cannot_ actually improve "quality" - they are not the developers working on the actual code, and can at best catch the worst errors.
5. The people who could improve quality (developers who actually write the code) lose extremely important feedback signals on how their software behaves when tested and used.

I have also seen QAs used as a "minimum quality gate" that "allows" an organisation to hire an army of poor-to-mediocre programmers. Fairly quickly that goes spectacularly badly.

## Summary

So the important take-away here is:

1. Tests must test what your users actually care about.
2. Those tests must be automated to sustain your velocity.
3. The testing pyramid is good and valid.
4. Start from the outside with your testing and work in only as much as you must.

And why we do it that way is:

1. The features for users is more important than the internal workings.
2. Without full-automated coverage we cannot continue to confidently add features.
