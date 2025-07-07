+++
title = "Approaches to refactoring, technical debt and legacy code"
+++

Sometimes a codebase has an overwhelming amount of "terrible" stuff that as a developer you almost can't help but just diving in and fixing it. Doing this without thinking too hard can result in many variations of failure, such as:

* Upsetting the people paying you because you are doing something they don't consider important.
* Never finishing the mammoth rewrite you took on, resulting in a mess of two different styles of code.
* Personal burnout.
* Fixing things that maybe weren't actually that important (even if they make you cry whenever you have to look at their source code), at the expense of failing to fix more urgent problems or building useful features.

This article is a collection of research, links, thoughts and ideas that I've captured here for both of our benefits. It's a bit disjointed to read, but the point was more to capture all the key concepts and resources that are floating around in tech land.

---

⏩ If you want the executive summary, head over to my [Leaders guide to technical debt - aka "why can't we ship anything!?"](https://charmconsulting.co.uk/2020/11/27/leaders-guide-to-technical-debt/) 🧐. For the technical details read on below.

![word cloud from article](/assets/debt-cloud.png)


## Must-read articles

Here's a couple of must-read articles on the subject:

### Refactoring


> "We take the next feature that we are asked to build, and instead of detouring around all the weeds and bushes, we take the time to clear a path through some of them."
>
> ~ Ron Jeffries

In short, don't make debt cleanup its own task, just tackle what gets in your way as you go, and leave the camp tidier than you found it.

I recommend reading the whole article here: [Refactoring -- Not on the backlog! by Ron Jeffries](https://ronjeffries.com/xprog/articles/refactoring-not-on-the-backlog/), it's not too long.

### Technical Debt

> "Tech debt": an overloaded term. There are at least 5 distinct things we mean [when] we say “technical debt”.
>
> 1. Maintenance work
> 2. Features of the codebase that resist change
> 3. Operability choices that resist change
> 4. Code choices that suck the will to live
> 5. Dependencies that resist upgrading

Read the full explanation of each type of debt here: [Towards an understanding of technical debt by Kellan Elliott-McCrea](http://laughingmeme.org/2016/01/10/towards-an-understanding-of-technical-debt/), a bit longer but an important piece of writing.

## Huge piles of debt

If your project is sooo "bad" that you feel like throwing it out, you might do well to heed this quote:

> "There is only one way to eat an elephant: a bite at a time."
>
> ~ [Desmond Tutu (via Psychology today of all places!)](https://www.psychologytoday.com/us/blog/mindfully-present-fully-alive/201804/the-only-way-eat-elephant)

Which to me means iterate your way to good.

It doesn't mean have no plan, in fact you should know where you are trying to get to and how realistic that is so you don't end up with a rewrite that can never be completed because it was too ambitious.

## Even more reading

### Is a mess a debt?

> "A mess is not a technical debt. A mess is just a mess."
>
> ~ Uncle Bob

[A Mess is not a Technical Debt by Uncle Bob](https://sites.google.com/site/unclebobconsultingllc/a-mess-is-not-a-technical-debt) suggests that the use of the term debt is for a considered short term trade-off just like taking out a loan, but a mess is nothing of the sort as there is no up-side to creating a mess versus having a clean but temporary solution to a problem.

### More taxonomy of bad code: the Reckless/Prudent vs Deliberate/Indavertent quadrant

Martin Fowler shows that you can categorize debt by whether it is reckless or prudent, and separately whether it was deliberately or inadvertently added to the code.

> "Technical Debt is a metaphor, so the real question is whether or not the debt metaphor is helpful about thinking about how to deal with design problems, and how to communicate that thinking. A particular benefit of the debt metaphor is that it's very handy for communicating to non-technical people."
>
> "The useful distinction isn't between debt or non-debt, but between prudent and reckless debt ... there's also a difference between deliberate and inadvertent debt."
>
> "The decision of paying the interest versus paying down the principal still applies, so the metaphor is still helpful for this case."
>
> ~ [The Technical Debt Quadrant by Martin Fowler](https://martinfowler.com/bliki/TechnicalDebtQuadrant.html)

These are useful definitions that can help clearly communicate complex issues with the code to people not directly involved in the code.

It's well worth reading much more of Martin Fowler's writing. There's so much to learn from Martin about programming good practice; the articles are all written in a very human and accessible style.

### Legacy tests

Now that TDD is widely adopted we're faced with cleaning up the output of those who [cargo-culted](https://en.wikipedia.org/wiki/Cargo_cult_programming) test coverage, or had well meaning but ultimately badly formed attempts at adding tests to their code, sometimes with prodigious volumes of test code.

I think "Legacy tests" is a useful term to describe these problematic tests. Nat Pryce outlines some useful hints that you have legacy tests on your hands:

> "Symptoms of legacy tests I have encountered include:  
> ...  
> Tests are named after issue identifiers in the company's issue tracker.  
> Bonus points if the issue tracker no longer exists."
> 
> ~ Nat Pryce, [Working Effectively with Legacy Tests](http://natpryce.com/articles/000813.html)

## Prevention is better than cure

How do we stop it building up in the first place?

I see several sources of the build up of technical debt:

1. Lack of knowledge and experiencd of programming patterns and practices to keep debt in check. This can be addressed with courses, learning from peers, attending meetups and conferences, reading books, watching youtube and many other ways of getting input from beyond the current code editor.
2. Problematic mindsets in programmers - short term thinking, narrow thinking, or blindness to the broader consequences of the choices being made in the moment. This is a more stubborn malaise, and people are not quick to change their identity. Some will respond well to just being asked to consider the second and third order effects of their choices (e.g. "you could give this other team direct access to the sql db instead building an API for them, and yes it's quicker, but then you won't ever again be able to rename a column without consulting with them), but some people will double down in their thinking and are not open to improvement.
3. Dysfunctional dynamics between engineering and their non-technical peers and leaders. Common issues include:
   1. Deadline-driven-development (especially when unrealistic and vigorously enforced),
   2. Asking non-technical leaders to make engineering decisions.

> The client / boss / project manager responds [whilst thinking “I have no idea what you are talking about, or why you are asking] “Which is quicker? Do that one.”
>
> Then the engineer gets the hump that they can’t do a good job.
> 
> ~ from ["Why do automated tests matter?" by Tim Abell](/2024/03/27/why-do-automated-tests-matter/#programmer-excuses)

## The audio version from Codurance

[Codurance](https://codurance.com/) hosted an insightful round-table podcast episode with a group of people who are clearly very experienced. You can listen here: <https://codurance.com/podcasts/2019-01-21-legacy-code/> and will doubtless be inspired by some things in there. The conversation takes a little while to build momentum but it's worth the wait.

Here some highlights of what I learnt from listening to the show:

### The Feathers Book

* [Working Effectively with Legacy Code by Michael C. Feathers](https://www.amazon.co.uk/Working-Effectively-Legacy-Michael-Feathers/dp/0131177052/) is *the* book to read on the subject.

Feathers defines legacy code as code without tests.

> "Preserving behaviour is a large challenge. When we need to make changes and preserve behaviour, it can involve considerable risk."
>
> ~ Michael C. Feathers

This book is heavily geared towards unpicking the difficulties in getting untested code under test in object-oriented static typed languages such as Java, C# and C++, and modifying it safely.

It is a detailed and thorough treatment of all the tactics available to bring untested object-oriented code under test, specifically sprawling and smelly classes and methods. It won't help you with larger scale problems such as poor structuring of microservice architecture, message bus systems etc.

This [article summarizing the Feathers' Legacy Code book](https://understandlegacycode.com/blog/key-points-of-working-effectively-with-legacy-code/) has some of the tactics detailed and gives a good flavour of the book so you can decide whether to dive deeper.

### Named techniques and related libraries

* [Characterization testing](https://michaelfeathers.silvrback.com/characterization-testing) is the idea of creating tests to probe and demonstrate the existing behaviour of previously untested code.
	* Related to this is "approval tests" which allow you to easily incorporate snapshots of output (json, xml, logs etc) into your tests in order to capture existing behaviour and be able to spot any variations that pop up during refactoring.
	* [ApprovalTests.net](https://github.com/approvals/ApprovalTests.Net) is a dotnet library for implementing approval tests.
* Introducing [seams](http://wiki.c2.com/?SoftwareSeam) into software can be a useful technique for breaking down untestable monoliths into testable chunks on the way to better code.
* [Mutation testing (wikipedia)](https://en.wikipedia.org/wiki/Mutation_testing) (more info on [mutation testing at csharp academy](http://csharp.academy/mutation-testing/)) is a useful way of checking how good your test coverage really is. It is the idea of making (almost) random changes to the code under test to see what whether your tests spot the change in behaviour.
	* For dotnet this can be done with [Stryker.net](https://github.com/stryker-mutator/stryker-net)

### Approaches from hard-won experience

* Make as few changes as possible to get untested production code under test. The first cut of tests will likely be fragile.
* It's more important that legacy code that is already in production continues to behave as it currently does than that it behaves as originally specified. People and downstream systems may now rely on that "incorrect" behaviour.
* Does the organisation (culture, systems, pressures etc.) cause bad code to be created? If you don't fix that then you will always get more "legacy" code.
* The importance of competent technical leadership within an organisation for preventing the build up of catastrophic levels of technical debt.
* When communicating, quantify the cost of problems with the legacy code. E.g. "you are losing 1 in 5 developer-days to coping with bugs introduced due to the lack of automated regression tests".
* Have the hard conversations with the business about the cost of fixing the mess.
* Doing a rewrite is (almost) always the wrong answer.
* Get small wins, even if you are facing a huge challenge.

## Maybe modelling is the problem

Something that looks like bad code could be that way because of a failure to properly model the real world.

Domain Driven Design (DDD) has much to teach on the matter, and this is a great video on the why modelling could be the problem:
[Technical debt isn't technical - Einar Høst - DDD Europe 2019 - YouTube](https://youtu.be/d2Ddo8OV7ig)
## Small Batches Automated Testing Podcast Episode

Podcast episode [Software Delivery in Small Batches: Automated Testing with Jason Swett](https://share.transistor.fm/s/a5ca21cb) talks about practical approaches to legacy code, including the idea that you actually can't always avoid writing some more untested code because of the cost-benefit trade-off.

> "You can’t just slap a test on any change that you make because the underlying functionality might be really complex"

The episode describes the evolution of our industry in learning the importance of test coverage for avoiding known risks in software development, and declares that you cannot truly call yourself a professional developer if you are not writing tests.

> "I always recommend starting with the easiest most trivial stuff, adding some tests in those areas and then working up to the bigger areas"

Some relevant thoughts from the episode:

* Good test coverage is a pre-requisite to any higher-level automation such as continuous-deployment. (1:35)
* To add tests to a project that has no coverage you have to retrofit test tooling and infrastructure (CI, data management etc). "That can be very non-trivial, even for someone very experienced, ... it's going to be a huge challenge to add that stuff retroactively." (3:10)
* With regards to the idea of "Declaring that we are going to write tests for every PR from now on." (7:10)
	* "You can't just slap a test on any change that you make because the underlying functionality might be really complex. In order to write a test you might have to have certain setup data to create the state required for that test might be extremely complicated. To expect somebody to include a test with every PR is not realistic. For some features your change might be 10 minutes of work but to get the test setup, that might be weeks of work in order to take the 20-minutes to write the test."
	* "I always recommend starting with the easiest most trivial stuff, adding some tests in those areas and then working up to the bigger areas. It seems that you should start with the most important stuff but that's not realistic because the most important stuff is also the hardest to test."
* A useful step might be to just get tests in place on your own machine without worrying about CI initially (they were talking about training a developer, but it's a useful thought for being efficient tackling legacy projects) (9:30)
* "Having high quality code is almost impossible without good test coverage. Test coverage enables refactoring. If you can't refactor your code it's really hard to keep it in good shape." (17:15)
* As you flush out bugs by adding more and more coverage: "The type of issues you find over time, the complexity goes up, because they're not really related to the interplay of something known, they're usually related to more and more complications; instead of just one unit of code interacting... [it's] 5 or 10 or 200; these larger components and permutations that you never considered in the first place, because some customer hit it for the first time." Moments where you go "woah I never even knew that was possible" (25:50)
* "It all comes down to managing risk, risk of the software in question being correct" (30:20)
	* "There's a risk of producing incorrect software, but there's also a risk to the business that the engineers will not be able to keep pace with the business if they have to spend so much extra time just verifying the software, there's a mistake in thinking that writing tests takes more time, the reality is that if you have automated tests then you will be able to work much faster than if you didn't"
* On a project that had tests once - "...at some point tests had stopped passing", should you "blow them away or fix them?". (32:22)
	* For an "application that's been developed for two years with no tests with this big team and they don't have the skills; that's going to be a big up front investment, it's going to be a year or two before [adding test coverage] starts to pay off."
	* "... at some point tests had stopped passing and they were never updated - okay do I trust these or not? If they're not passing, do I blow them away or fix them." - In this case blew them away and spent three months writing tests such that he could build new features. "Even now [the project has] low test coverage. This has been a multi-year effort."
	* "This is one of the real problems when it comes to testing, is that if for some reason the people who start the project don't do testing, and the project is successful enough to go on for X number of years without it, then the effort required to add testing after the fact is an order of magnitude than it would have been at the beginning." ... "the can gets kicked down the road."
	* "Frustrated by the attitude of 'let's not spend time making this code high quality because what if this startup fails' but what if this startup succeeds? Yes it may be possible you only survive by cutting corners but not convinced, think it might be a delusion."
		* "The only way to go fast is to go well." ~ Bob Martin
* "Why is good code good? It's fast to work with. I prefer to say 'the code is understandable' because that makes it more clear. Good/bad sounds like inward looking practicing of a craft. 'Not Understandable' is more tangible - that means it's time-consuming and expensive to work with. Understandable code is faster and less expensive to work with." (35:20)

> "It all comes down to managing risk"

The people on the episode are Ruby developers, but the lessons they talk of apply regardless of language.

(Some of the quotations above are paraphrased)

## Thanks, now I'm even less sure what to do

Are you wrestling with something you don't like in a codebase you have to deal with? I'm guessing that's why you're here. Or maybe someone sent you this along with a rant about the tech debt in the codebase you own.

Either way, I suggest slowing down a bit, sitting down together (while maintaining social distancing), and considering how all the things that bother you about the code in front of you fit in to the various taxonomies detailed above. Then use that assessment to make a calm and rational plan about roughly where you want to get to. Then decide on the *one* next thing you will do towards that. Use the Ron Jeffries approach to get you there without wasting time on things that don't really matter.

Practically, that might mean if you have a user story, ticket or Trello card for a feature, it might take longer to do as you include the work to "pay down" some of that badness along the way, knowing that it will improve your overall velocity over time. Be wary of pulling out separate "debt" stories to do, though that can work if the team dynamic is right.

To keep your stress levels down make it a shared team problem, have a bit of a laugh about it, take regular breaks in the great outdoors, and support each other.

Good luck!

I'll leave you with this little song I found on YouTube about bugs:

<iframe width="560" height="315" src="https://www.youtube.com/embed/kuJI4hmvY8c" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Further Reading

If you want to avoid the task at hand by reading the whole internet in the hope that it will help, start here:

* A lengthy set of opinions on what to do with a huge 10 year old untested pile of spaghetti code:  <https://softwareengineering.stackexchange.com/questions/416242/is-it-the-correct-practice-to-keep-more-than-10-years-old-spaghetti-legacy-code>
* Pluralsight have written an excellent long-form article on the subject: <https://www.pluralsight.com/blog/software-development/erasing-tech-debt>
* The Engineering Manager on technical debt: <https://www.theengineeringmanager.com/growth/how-to-argue-the-space-to-tackle-technical-debt/>
* <https://adevait.com/software/technical-debt>
* <https://medium.com/@adamberlinskyschine/wtf-is-technical-debt-b9e9d5f89d9>
* <https://wtfismyengineertalkingabout.com/2017/03/18/wtf-is-technical-debt/>
* <https://codingsans.com/blog/technical-debt>
* <https://builtin.com/software-engineering-perspectives/technical-debt>
* <https://www.bmc.com/blogs/technical-debt-explained-the-complete-guide-to-understanding-and-dealing-with-technical-debt/>
* <https://dzone.com/articles/what-technical-debt-it-and-how-to-calculate-it>
* <https://bigrivertech.com/technical_debt_assessment/>
* <https://www.cutter.com/consulting/technical-debt-assessment-and-valuation>
* <https://martinfowler.com/tags/technical%20debt.html>
* <https://codeclimate.com/blog/10-point-technical-debt-assessment/>
* <http://thinkapps.com/blog/development/technical-debt-calculation/>
* <https://www.productplan.com/glossary/technical-debt/>
* <https://leadership.garden/tips-on-prioritizing-tech-debt>
* <https://www.steveonstuff.com/2022/01/27/no-such-thing-as-clean-code>
* <https://leadership.garden/tips-on-prioritizing-tech-debt/>
* [Youtube: "Types Of Technical Debt And How To Manage Them" ~ Dave Farley](https://www.youtube.com/watch?v=1MBpK_PxEnU)
	* "Sense of design" over life of system, not just good design up front.
	* Measure of quality is ability to make changes
	* Metaphors for different types of tech debt:
		* Family loan
		* Bank loan (lack of tests)
		* Loan shark (visit from knuckles)
		* Organised crime loan (fatal if not repaid. Legacy technology)
* [Youtube: "7 Ways to Get Ahead of Technical Debt & Keep It Under Control" ~ Rob Walling & Derek Reimer](https://www.youtube.com/watch?v=kf1GzhiI9yQ)
	* Seen a business acquisition fail due to tech debt found during "due diligence"!
* The "Lava Flow" anti-pattern where code is written, ossifies and leaves an archaeological record of all previous design attempts, libraries and technologies in the current production code rather than the git logs where they belong
	* <https://mikehadlow.blogspot.com/2014/12/the-lava-layer-anti-pattern.html>
	* <http://antipatterns.com/lavaflow.htm>
	* <https://en.wikipedia.org/wiki/Lava_flow_(programming)>
