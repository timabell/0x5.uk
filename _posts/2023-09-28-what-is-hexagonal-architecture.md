---
title: What is Hexagonal Architecture, aka "Ports and Adapters"
layout: post
---

* toc placeholder
{:toc}

## Hexagonal Architecture? Uh... what?

I'd largely ignored hexagonal architecture thus far in my career. I'd heard of it at some point. Read a bit about it and not really grokked it. I talked to some people and got the impression it wasn't that good/relevant/useful and as such never looked much closer. From my brief skim of the material out there I hadn't bridged the gap between the vague concepts outlined and the realities of applying such a pattern. Given the reaction of others I'd left it at that.

After reading and watching everything I could find on the subject it *still* seemed like a pointless abstraction to me that encourages over-engineering. Good design and isolating dependencies are something that any decent programmer would "just do" by using interfaces in C# or some equivalent in other languages. It is also normal in my experience of high-performing engineering teams that business needs and testing would drive out the right "shape" for these interfaces/abstractions over time without needing someone to say "let's use hexagonal architecture" and seeing who understands the shibboleth or at least pretends to.

If like me you haven't grokked this odd-ball "pattern" then hopefully this post will help you. I put this post together having consumed absolutely everything I could find on the subject, discussed it with friends and generally having spent a lot of time mystified. Perhaps I can explain the common understanding of the pattern amongst those who like it and use it in a way that the pre-existing material failed to do for me. I'm still not 100% convinced by this "pattern", but at least I feel like I understand the intent now.

### A rude awakening

Then the other day I bumped into hexagonal architecture *HARD* in an initial meeting with a potential consulting client, which went something like this:

> *Client*: "Tell me about hexagonal architecture."  
> *Me*: "Uh, I've heard of it but don't know that much about it... I heard it's mostly rubbish."  
> *Client*: "We use it here, you are the weakest link, goodbye. [*Click!*]"

Not particularly being a fan of this kind of interaction I went on a mission to *really* understand what the hell it is.

Having discovered that the view of hexagonal being largely pointless was not actually universal amongst programmers, but still skeptical, I [posted my disdain on LinkedIn](https://www.linkedin.com/feed/update/urn:li:activity:7083072166547595264/).
A key point that I picked up from these discussions is that *the pattern is more generalized than "interfaces in C#"* (or Java), it's seen as a *generic* pattern with the intent of isolating one or more pieces of pure code from the messy world around it in all directions. It can be used as a mental model regardless of the technology choices in place and the layer of technology under discussion.

For example you can use the terminology to describe a piece of pure Ruby, C#, Rust, PHP etc. being isolated from UI and network concerns and independently testable, or you can can describe a microservice being isolated from other microservices with http and/or messaging boundaries (or so I'm led to believe, reach out if you know different). The discussion on LinkedIn and further questioning of other devs made it clear I still had a bit of an understanding gap; this prompted me to dig further. Clearly enough developers out there believe this is a valid and useful pattern, rightly or wrongly.

I'll now attempt to save you the same journey of pain, confusion and archaeology that it took me to get to my current understanding. I'll then present my opinions on the strengths and weaknesses of this so-called pattern.

## Hexagonal Architecture Explained

Here's my take on what "hexagonal architecture" means in 2023 to developers who wish to have a shared understanding and easy communication of this "pattern":

### History

The term "hexagonal architecture" was apparently coined by [Alistair Cockburn](https://www.linkedin.com/in/alistaircockburn/) (pronounced "co-burn") circa 2005, and was made popular by his article of the same name, which you can still find at <https://alistair.cockburn.us/hexagonal-architecture/>. It may originally have been presented in an [Association for Computing Machinery (ACM)](https://acm.org/) paper before that (I have not been able to find the paper, if you have access please let me know).

The alternative name "ports and adapters" is included in the original 2005 article title. Both names are still in popular usage amongst developers with "ports and adapters" perhaps being the more "precise" term.

This named pattern was born out of frustration with logic being entangled with untestable user-interface code in Java systems.

The pattern was proposed at a time when "N-Tier layers" in Java were king, so was intended to be in contrast with that.

### Visual Representation

The "hexagon" in the name refers to the visual representation, drawn something like this:

![My diagram of hexagonal architecture](/images/blog/hexagonal/hexagonal.svg)

The visual representation of the pattern shows:

1. the isolated core logic inside a hexagon,
1. ports around the edge of the core,
1. adapters around the edge,
1. optionally an outer hexagon,
1. outside of which is the things that interact with the core logic via these "adapters"

The hexagon shape was chosen to give many surfaces on which to draw ports and adapters.

The pattern evokes an image of a honeycomb of hexagonal logic units all collaborating, but this wasn't actually part of the original pattern and doesn't seem to be a common way of talking about it.

### Defining features

1. Isolation of a core of logic from:
	1. things that make use of the logic, and
	1. things that the logic depends on.
1. Testability of the logic in isolation from all dependencies.
1. Terminology:
	1. The interfaces that the core logic exposes are named "**ports**".
	1. Code (if any) that connects ports to real / alternative / test / fake implementations of related systems and logic are called "**adapters**".
	1. Connections to things that **depend on the core logic** such as a user-interface are named "**primary** ports/adapters". (Generally drawn on the left.)
	1. Connections to things that **the core logic depends on** such as a database are named "**secondary** ports/adapters". (Generally drawn on the right.)
1. Technology agnostic;
	- can be applied to Java, C#, Ruby, Golang, ASM, F#, Javascript etc.,
	- can be applied in the context of Web, Embedded, Punched Card, Mainframes, Serverless, Desktop Apps, Mobile Apps, etc.
1. Agnostic to implementation details of how boundaries are actually defined, e.g.:
	- C# interfaces,
	- Arbitrary boundaries between code in Ruby,
	- HTTP across microservices,
	- Message passing systems (in code or across networks),
	- Rust traits
	- npm packages
	- etc.

## Critique

### An imprecise pattern

Okay, I get it now, but I still don't *like* it as a pattern.

It's far too imprecisely defined to be useful in clearly and precisely communicating a design idea.

Before you can use the pattern name to helpfully describe a particular architecture you are communicating, first you have to explain exactly what you mean by the name. It's not at all clear how you would code up this pattern in any modern codebase just from reading Alistair's original post. There are many youtube videos on the architecture, but given the imprecision of the original post I'm left wondering if these videos are people's own spin and extension of the original article or whether they have access to sources that I do not. If you know of any other primary sources for this then let me know, has he ever spoken on the subject? Was it recorded?

The detailed context in [Alistair's original description of hexagonal architecture](https://web.archive.org/web/20051124130845/http://alistair.cockburn.us/crystal/articles/hpaaa/hexagonalportsandadaptersarchitecture.htm) from 2005 (which has changed little since then) is so far removed from what we actually deal with these days that it is of little help in figuring out how it communicates intent when someone declares they wish to apply it to a modern system (it speaks of the ancient FIT test framework and the legendary Java Factory classes that are a primary reason for modern developers laughing at Java).

Hexagonal architecture, or ports and adapters, is nothing more than a fancy way of saying "isolate your business logic from all the real world mess of dependencies". It's a generic way of describing keeping pure beautiful logic code out of the tangled web of UI, database and other messy concerns. Some people use it to mean pure code boundaries, some use it to talk about microservice boundaries and the like. I've had a few people mention "hexagonal" to me over the years, and I read the original article many years ago, but I could never connect the name with *what that really meant in code*. I've had to go on quite a journey to get to the point where I could say a piece of code does or doesn't "implement" hexagonal architecture. That seems like long way around to "isolate your code from its dependencies", which is what I would normally have said. The *concept* of the named pattern is valid, but I don't think I can recommend using the names "hexagonal" or "ports and adapters" to anyone else.

I think it's actually better communication to just describe the actual architecture in clearer and less obfuscated words than to use the "hexagonal" or "ports & adapters" names; and after all inter-developer communication is big part of the value of named patterns.

### Why so popular?

The pattern was created for a narrow reason (entagled UI code, reaction to n-tier), and for some reason has spread as a meme (in the Richard Dawkins sense of the word) to minds far and wide in many diverse contexts, and in my view is proving to cause as much confusion as benefit. I suspect it's the attractiveness of the name "hexagonal architecture" which has such a pleasing ring to it that has carried it thus far, rather than its merits as a pattern per se.

### When should we apply the pattern?

As with a lot of patterns this pattern is often presented without much context as to when it would be appropriate to apply it and when it would be inappropriate or "over-engineering".

We have a bit of an epidemic of over-engineering in our industry, so I'd like to see more incremental and appropriate application of the various patterns, and more explaining of the context where they are and are not useful presented alongside them.

The original article talks of Java UI systems, but is not completely explicit on the intended use case, presumably assuming the reader is operating in a similar context to the author. This pattern has spread far beyond that original domain, being now held up as a panacea for all systems of all shapes and sizes without limitation.

### Poor explanations

There are a lot of explanations of this pattern out there that, in my opinion, don't really do the job of giving even an experienced programmer a good understanding of the intended concept to a level that allows them in turn to effectively pass on that understanding to others and apply it to real systems.

I had to talk to several people before I got the understanding I currently have, even after digesting much of what is out there, and I'm not exactly new to programming.

I think this is likely because there isn't actually that much to the original post. It describes a fairly simple problem (entangled, untestable code) and solution (isolate from your dependencies), with the addition of a choice of polygon to use when drawing diagrams and some imaginative naming. So when people came along afterwards and attempt to to extend the pattern into some kind of grand, overarching theory of everything their explanations are necessarily either wooly or reach far beyond the original definition resulting in further confusion.

The naming certainly lends itself to a certain grandiosity - "are you applying the *hexagonal* architecture?" certainly sounds more impressive to the untrained ear than it actually is. The grandiosity of the way it is named, presented and discussed, like some kind of magical panacea that I wasn't privy to certainly made me think I must be missing something beyond "decouple your dependencies" when I looked into it (I wasn't).

Hopefully this blog post will help bridge the gap, and help you truly grok the thing more quickly than I was able to, even if I wouldn't necessarily recommend the name itself.

### An Identity Crisis - Why Two Names?

It seems the "hexagonal" name has stuck, even though no-one really wants it. Apparently "Ports and Adapters" actually describes it better. I suspect neither name has emerged victorious because neither name completely covers it, and "ports and adapters" although marginally more descriptive is more of a mouthful than "hex arch".

Which name should we use?

- "Hexagonal" hints at the idea that there's an inside (logic) and an outside (everything else), and that it has multiple surfaces (ports). It fails to convey much more than that, particularly the "adapter" part of the pattern, why you'd care, or what it might be for.
- "Ports and adapters" nicely captures the detail of abstracting away a single dependency, but completely fails to convey the idea that we're isolating pure logic from messy dependencies.

Once you *know* what it means, and so does your whole team then it doesn't really matter much what the name is as humans are quite good at connecting random collections of phonemes with abstract concepts and remembering them, but patterns are definitely a bit more useful when there isn't such a steep curve to grok them and keep them in your head.

It would be nice if there was one term but whatever. Hopefully this post will help others who were confused by the whole charade get the concept into a concrete form in their head, wire up the two terms for it and get back to coding; whether or not they use it.

### The Good Bits

It's not all obfuscation and bad ideas. There's a core of good in the hexagonal / ports & adapters pattern.

If you have any business logic of any reasonable complexity, then there's a lot to be said for writing that in pure, unit-testable code that is not entangled with any of the workings of the outside world. And the hexagonal architecture, once understood by all involved, is a good shorthand for drawing that circle (sorry, hexagon) around the core logic and being able to easily discuss with peers whether that bright line has been crossed by any of the code.

By declaring this to be the pattern in use (don't forget to put it in your [ADR](https://adr.github.io/)), it becomes easy to spot and discuss violations such as:

- business logic hiding in code that deals with specific technologies (such as stored procedures, shudder, or aspnet MVC controllers)
- specific technology concerns leaking into the core business logic (such as knowledge of specific storage such as for example code that's specific to Azure Blob Storage).

Chris put it nicely in our LinkedIn back-and-forth:

> "What [ports and adapters] does is provide a separation of concerns between the essential complexity of your application (the domain model, if you want to use DDD terminology) and the accidental complexity of how it interacts with the outside world via strong abstractions."
>
> ~ Chris Bimson (LinkedIn comment, 2023)

This keeps code with the same reason to change together (business rules), and code with different reason to change separate (technology shifts).

Just be aware of the costs of ditching other abstractions blindly in the name of "architecture" (see section on repository patterns). Agility matters.

### Too much "Architecture"?

Beware the added complexity ([as mentioned by Alex Hyett in his youtube explanation of Hexagonal Architecture](https://www.youtube.com/watch?v=bDWApqAUjEI&t=377s).

Don't add this pattern if you don't actually *need* it.

I've seen code where blindly applying "hexagonal architecture" (or some unholy bastardization of it) resulted in ten times the code that should actually have been needed to solve the business problem, throwing away perfectly good abstractions like entity-framework in favour of miles of toil-inducing code and "repository" classes as far as the eye can see. Curiously, a long time ago, and in a very similar vein, I saw a team cripple themselves by creating no less than *seven* "layers" in their code where *none* would have been better... velocity slowed to an absolute crawl.

Like so many patterns, people talk about the pattern's strengths but fail to mention when you shouldn't use them, leaving you to deduce the context for appropriate application yourself.

What we want is not "no architecture", but it also isn't dogmatic and incorrect architecture. I don't think throwing in hexagonal because you can use it to [flex on the other developers](https://www.youtube.com/watch?v=r6tH55syq0o) is the right balance.

> "I also don't think you should YAGNI architecture to that extent, unless what you are doing is genuinely throw away. Architecture isn't optional - you'll get one whatever happens - it pays to think about it in advance so everybody shares a common technical vision and is pulling in the same direction."
>
> ~ Chris Bimson (LinkedIn comments, 2023)

If you know in advance that there will be sufficient complexity in the application and that this pattern is likely a good fit then put it in place early on and you'll be in a good place for robust evolution of the code in the long run without dissolving into a spaghetti mess later.

### Oh No, The Repository Pattern

Something that I really didn't like in the canonical article was the mention of the repository pattern. To be fair it's of it's time, but I've been burned by a C# project that cargo-culted the pattern. The result was an incredibly slow to iterate on system.

From the hex arch article:

> "From the application’s perspective, if the database is moved from a SQL database to a flat file or any other kind of database, the conversation across the API should not change."
>
> ~ Alistair Cockburn

Which made me think: Oh god, that old engineering anti-pattern, hello repository pattern bye bye EF & LINQ for things that were simple enough that it would be better.

In the days when you had to hand craft SQL for all CRUD, and embed it directly in your PHP code, the "repository pattern" seemed like a good idea. But I have personally seen train-wreck over-engineering projects where there was an attempt to brute-force a repository layer into something that would have been better without it.

Here's why you shouldn't do "repository" layers in modern applications:

1. Your ORM *is* a repository pattern. Hiding the ORM in some custom `IRepository` is nothing more than toil for a net-negative benefit. More layers are not always better, each layer costs you agility.
2. As query systems have got more powerful (see LINQ in dotnet, GraphQL, etc.) the idea of predefining every shape of query you might want to run and encoding it in an API or interface becomes a huge unnecessary drag on development speed, resulting in massive additional cost to the business in exchange for reduced agility.
3. The idea that you need to support switching data stores is just baloney. Unless your business tells you up front that they need Oracle + MSSQL + MySql then introducing an expensive abstraction on the off-chance is ludicrous, and not giving your client/employer good value for money. If you really do have to shift tech someday, then you'll be doing a lot more work than just swapping out an adapter; that's just naïve wishful thinking.
4. Swapping out storage for testing:
   1. So many bugs come from the integration of code, ORM and database that you should be including it in the majority of your test coverage, not mocking it out.
   2. There are better ways to solve this problem, such as in-memory versions of real databases, and tooling that allows easy resetting of the persisted state.

Of course sometimes it will be the right pattern to apply having considered the above, but as with all patterns, don't just slam it in because "you can never have enough architecture" (see also "CV-driven-development").

### Unit Testing - Good, But Not Enough

An example I recently saw of hexagonal architecture allegedly being used in a C# codebase was a good example of the weakness of unit testing as the sole bastion of regression testing. It had acres of unit tests for the individual over-simplified pieces dictated by their interpretation of this pattern, but zero end-to-end tests and thus basically no confidence in being able to make changes to the overall system without regressions.

It was also a metric ton of code and interfaces that could be largely eliminated giving more agility and less to maintain.

By mocking out things like storage, your tests only cover a fraction of what's important to the business.

If quality end to end tests (or Component tests as they were called in the last place I was at) are in place then you can have more confidence in the whole thing, but at that point the highly mocked unit tests that hexagonal architecture implies might become far less valuable, being more about testing many variations and reducing feedback time than being your only source of confidence.

Unit testing has its place in the pyramid of tests (particularly for testing many variations and combinations of scenarios quickly, i.e. "shift-left"), but if you have endless unit tests but don't know if anything works when integrated and shipped then you're doing it wrong (standard example in dotnet is forgetting to configure dependency injection in the non-test startup code).

Lately I've been seeing a welcome swing away from unit-testing-only in dotnet land towards an emphasis on "component testing", integration testing, end-to-end testing and a general eye towards preventing regressions in what the business and users actually care about rather than some microscopic detail when all around is fragile.

As ever, all things in balance. Use your brains. Caveat emptor.

I keep meeting people promoting either one extreme (unit tests!) or the other (black box "component" tests only!!) and either extreme seems a bit too absolute to me. (Perhaps I'd be a better conference speaker if I just declared an unreasonable extreme, lol).

The reason that the existence of "hexagonal architecture" bothers me in this context, is that someone has clearly used the term as: "it's a pattern therefore I must be right and you can't argue with me (p.s. I'm superior to you because I know this magic incantation of architecture and the non-technical folk lap it up)". If the pattern had never existed, it would be one less opportunity for this destructive behaviour.

## Going deeper

### The Original Pain: UI Entanglement

The current version of the hex arch article says it is a way of preventing mingling of logic with UI code:

> "… infiltration of business logic into the user interface code …"

So the original article was actually motivated by sloppy UI programming where logic and presentation were combined into an amorphous blob (I have seen this first hand myself too), and then the concept was extended to also cover the problem of tight coupling to dependencies.

Throw in a sprinkle of dubiously helpful analogies (ports like on physical computers, hexagons like because it needed a shape) and we have a "named architecture".

### Why Hexagons?

To slightly butcher the original for brevity and clarity:

> "The hexagon is intended … to get away from the one-dimensional layered [architecture] picture … and … [to accommodate] the presence of … [any] number of different ports … to allow the people doing the drawing to have room to insert ports and adapters as they need …"
>
> ~ Alistair Cockburn

So that's why it's not circles (Onions), or layers (N-Tier), or boxes.

### "Primary" and "Secondary"

According to Alistair these come straight out of UML nomenclature. See <https://www.softwareideas.net/primary-and-secondary-actor-use-case-diagram>

- **Primary** (usually drawn on the left by convention) are things that will actively use the core logic, such as GUIs, HTTP APIs for customers to use etc.
- **Secondary** (usually drawn on the right) are things that the core logic will make use of such as data storage, outbound messaging, subservient APIs etc.

The original article explains:

> "… ports and adapters show up in two flavors, which I’ll call ‘’primary’’ and ‘’secondary’’, ... idea from use cases of “primary actors” and “secondary actors”. A ‘’primary actor’’ is an actor that drives the application (takes it out of quiescent state to perform one of its advertised functions). A ‘’secondary actor’’ is one that the application drives …"
>
> ~ Alistair Cockburn

See this [explanation of UML primary/secondary actors](https://www.softwareideas.net/primary-and-secondary-actor-use-case-diagram) for context of these terms in [Unified Modeling Language (UML)](https://en.wikipedia.org/wiki/Unified_Modeling_Language).

### Hexagons versus N-Tier

Hexagonal architecture emerged at a time when N-Tier was the defacto standard for all software architecture, which is worth bearing in mind when trying to grok what on earth the hexagons are all about.

> "Perhaps the other key difference is how dependencies are orientated. So in your classic N-Tier architecture, even with good abstractions between loosely coupled layers, they frequently look like this:  
> `Presentation -> Logic -> Persistence`  
> … The difference can be subtle, but P&A places much more emphasis on explicit abstractions with a defined role than n-tier descriptions generally do."
>
> ~ Chris Bimson (LinkedIn comments, 2023)

### Hexagonal and Domain Driven Design (DDD)

I heard it said at some point that hexagonal architecture was an enabler for domain driven design. It took me a while to understand that statement. In some ways hexagonal and DDD say the same thing in different ways - that there should be a rich central model / logic which encapsulates the businesss logic.

The need for hexagonal architecture to "enable" DDD may be a reaction to the "[anemic domain model](https://www.martinfowler.com/bliki/AnemicDomainModel.html)" problem. The description of hexagonal architecture encourages thinking of a rich piece of logic at the centre, not just a collection of inert nouns; and the "ports" around the edge (in whatever form they take) give access to that logic through more than just "get" and "set" methods, and this definitely pushes in the same direction as DDD.

Having looked into this, I wouldn't say you have to have or even know about hexagonal architecture to do DDD well, but I can see how the two concepts can be used together when discussing conceptual designs amongst engineers so that's something worth being aware of at least.

### Pattern Archaeology

The historical context of this pattern is important to understand to get where it is coming from.

The whole thing makes more sense if you think of the Java N-Tier Big Architecture world that I believe it emerged from, rather than the more sensible C# that I've seen better teams do without such concepts.
It's not clear when this terminology was created, and who came up with it first. I did some digging but didn't really get to the bottom of it.

A [search on google trends](https://trends.google.co.uk/trends/explore?date=all&q=hexagonal%20architecture&hl=en-GB) indicates that it's probably been in use in some form since as early as 2005/2006. I don't know what the earlier spikes are and whether they are relevant or something unrelated. Perhaps the early spikes are from the CM paper, or maybe even his own checking for the term as it's only in 100s not 10,000s.

![google trends screenshot](/images/blog/hexagonal/hexagonal-trends.png)

The oldest reference I could find on Alistair's website is from 14th Nov 2005: <https://web.archive.org/web/20051124130845/http://alistair.cockburn.us/crystal/articles/hpaaa/hexagonalportsandadaptersarchitecture.htm>

The heading claims an even older date of 4th September 2005:

> The Hexagonal (Ports & Adapters) Architecture  
> Alistair Cockburn, Humans and Technology, arc@acm.org,  
> HaT TR 2005.02, Sept. 04, 2005,  
> ©Alistair Cockburn  
> (v 0.9 to be updated after reader comments)  

This rather implies that it was published somewhere in [Association for Computing Machinery (ACM)](https://www.acm.org/) but I can find no record of it. That fits in my experience as the ACM seems a peculiarly out of touch and academic institution from my perspective as a doer. (I tried their podcast lately, some great names being interviewed by an awful interviewer). If anyone can find a record of that publication let me know. I contacted ACM by email and they say they have no publication by the name of "Humans and Technology" so the trail is cold for now. I'll possibly give Alastair a shout on LinkedIn for more info as he seems to still be active.

Following the internet archives of Alistair's site, the original page was moved when he was running the mediawiki software on it. It appears in the archives on 11 July 2006: <https://web.archive.org/web/20060711221010/http://alistair.cockburn.us/index.php/Hexagonal_architecture>. This one is worth a look as it has context that appears to be missing from more recent versions.

It was interesting to run a diff on the oldest and newest copies of the article to see how much has changed in 18 years. The answer is not a lot apart from a bit of formatting and whitespace noise. I put a cache of the original in a gist and then overwrote it with a cache of the latest as a mirror, so you can see the diff here: <https://gist.github.com/timabell/4f6b6d222b7742f4784b3b306a0cfd43/revisions?diff=split>. I only spotted two changes, a typo fix, and that for some reason "event" has been replaced with "driver", presumably to broaden it from event based UI programming, to anything that might want to use the core logic.

## Alistair on video

- [Rodrigo Branas: Hexagonal Architecture (Ports and Adapters) with Alistair Cockburn // Live #98](https://www.youtube.com/watch?v=AOIWUPjal60) - May 2022 interview with Alistair, digging in to the history.

## Footnotes

### References & further reading

* [The original article on hex arch by Alistair Cockburn](https://alistair.cockburn.us/hexagonal-architecture/)
	* [Archive of Alistair's hex arch article on archive.org](https://web.archive.org/web/20230418161402/https://alistair.cockburn.us/hexagonal-architecture/)
* [A talk on Rust Crux that follows the hex arch](https://youtu.be/cWCZms92-1g?t=964) - no coincidence that Crux is also business logic interfacing with a user-interface layer and keeping the two concerns separated
* [c2 wiki on hex arch](http://wiki.c2.com/?HexagonalArchitecture=)
* [c2 wiki on ports and adapters](http://wiki.c2.com/?PortsAndAdaptersArchitecture=)
* [Explanation of UML primary/secondary actors](https://www.softwareideas.net/primary-and-secondary-actor-use-case-diagram)
* [The LinkedIn discussion where everyone tells me hex arch is *not* irrelevant mumbo jumbo](https://www.linkedin.com/feed/update/urn:li:activity:7083072166547595264/)
* Someone else trying to explain it: <https://medium.com/idealo-tech-blog/hexagonal-ports-adapters-architecture-e3617bcf00a0> (my apologies for linking to the horror that is medium).
* And another explanation: <https://dev.to/timhub/learn-to-build-a-hexagonal-architecture-micro-service-l1h>
* ["Hexagonal Architecture: What You Need To Know - Simple Explanation" by Alex Hyett on YouTube](https://www.youtube.com/watch?v=bDWApqAUjEI). - This was nice and clear, and touched on the pros and cons.
* [vaadin - DDD Part 3: Domain-Driven Design and the Hexagonal Architecture](https://vaadin.com/blog/ddd-part-3-domain-driven-design-and-the-hexagonal-architecture) - an exceptionally long piece with one person's opinions on using hexagonal with DDD.
* <https://softwareengineering.stackexchange.com/questions/386102/arent-domain-driven-design-hexagonal-architecture-with-real-world-constraints>
* [Hexagonal Me](https://jmgarridopaz.github.io/)

### Attack Ideas not People

To be absolutely clear here, I applaud Alistair for taking the time to express and communicate a concept, and push the state of the art forward at the time. My critique of "hexagonal architecture" above should be taken as an assessment of current usage and value, and in no way be inferred to imply that anyone should hesitate to publish whatever ideas they think will be of value to the world. Put your ideas into the world and let them stand or fall on their own merits.

Alistair was [publishing papers when I was still in school](https://dl.acm.org/doi/10.1145/157709.157750) and copying BASIC programs into an Amstrad in my holidays.


### Broken URLs

While I was researching this the original author had [unhelpfully ripped down their entire website](https://web.archive.org/web/20230606080030/https://alistair.cockburn.us/coming-soon/) so I was left searching archive.org for the true source. Pretty poor show for anyone in software imho, websites really aren't hard to keep running these days. So with that battle scar in mind here's an archive link to the current version of the original hexagonal architecture post in case it happens again: <https://web.archive.org/web/20230418161402/https://alistair.cockburn.us/hexagonal-architecture/>

I'm pretty shocked that anyone who claims to be in tech, a programmer no less, thinks it's okay to just redirect everything on their site to a coming soon page in the name of a "rebuild". There is no excuse for this. It is not at all hard to build a new site offline, check all the redirects if you wish to change urls, and then flip the DNS when it's a-okay. At time of writing he's put back the hex arch url, but all the links on it are broken as everything else is redirecting to the stupid kitch coming-soon page with the idiotic grinning ronald mcdonald image who sits their taunting anyone who actually wanted to know anything and proving that this was for whatever reason a 100% intentional act of destruction. Thank goodness for archive.org.

Alistair, if you're reading this, then please also read [Cool URIs don't change](https://www.w3.org/Provider/Style/URI.html), and try and find a way to do your migrations without months of downtime next time, it's really not cool.

### Pronouncing Cockburn

It's pronounced "co-burn" and is of Scottish origin according to Alistair.

> "pronounced "[Coburn](https://web.archive.org/web/20051215124021/http://familytreemaker.genealogy.com/users/c/o/c/Russell-W-Cockburn/?Welcome=1058060142)", the [Scottish](https://web.archive.org/web/20051104031017/http://www.clanshop.co.uk/clans/cockburn.htm) [way](https://web.archive.org/web/19991117103944/http://www.tartans.com:80/clans/cockburn/cockburn.html)"
> 
> ~ [Alistair's original site header](https://web.archive.org/web/20051124112619/http://alistair.cockburn.us/)


<https://en.wikipedia.org/wiki/Cockburn_(surname)>

## Feedback please!

If you think there's something I've missed here, or you don't agree with my description then please do get in touch so this article can be improved to the point of being useable as a canonical guide to all who seek to understand the pattern and use it as a communication tool between developers and other interested parties. That, after all, is the whole point of "patterns".
