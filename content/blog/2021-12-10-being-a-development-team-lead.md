---
title: Being a development team lead
layout: post
---

Here's my take on what it means to be a dev-lead / tech-lead / lead developer; and why it's time I stepped up.

I'm going to explain what I think makes for a really good high-functioning dev team, and how to get there along with links to essential reading on the subject.

As always contributions and thoughts welcome, drop me a line. If you want me to help with your team just shout. I love to just chat with people about their challenges in digital delivery, whether or not I end up becoming part of the project.

I'm also going to say why I think it's time I shifted *my* contracting focus from individual contributor to being a lead dev for teams.

## How to be an excellent lead dev

Having worked under many team leaders of all types I have a pretty good idea of what's pleasant and effective. And I'm glad to say that being a nice human being to be around is a big part of being a great leader. Dictatorial, unpleasant and command-and-control leadership are just not the right tool for running complex digital delivery projects

### Servant-leader

The best leaders I've come across are almost deceptively non-leader-like. This is because our culture in the west (hello press, television and film) portrays "leaders" as hard-ass bullies who get the best out of an organisation by ordering people around, knowing all the answers like some kind of god and generally being unpleasant. The reality is that the best leaders don't lead by intimidation, they lead by example, lead by being humble, lead by coaching (see below) and know that relationships and trust are what really matter for teams that can ship and respond to problems.

### Culture of trust

Everyone in the team is doing the best they can with the knowledge and circumstances they have. We can all help each other get better with trust and a good dose of [nonviolent communication](https://www.amazon.co.uk/Nonviolent-Communication-Marshall-Rosenberg/dp/1591791707).

### Openness with all

[Make things open: it makes things better](https://www.gov.uk/guidance/government-design-principles#make-things-open-it-makes-things-better).

I've always thought it best that anyone in the organisation who is interested can see every last detail of what we're working on, right down to the code. This does of course require a culture of trust, but if that's missing there are deeper problems to be solved.

There are of course some things that need to be protected such as production keys and the personal data of users.

As an example I ran an end-of-sprint demo for a client with all the major stakeholders present for an important project. The demo consisted of a "red screen of death", which showed that we had been unable to get a particular piece of technology with which the team was unfamiliar to work even after a whole sprint on it. Once the shock of the blunt honesty subsided the senior stakeholders were able to see that something needed to be done to ensure success and helped us recruit an external consultant with expertise in that particular technology. From there on things went much more smoothly. If we hadn't demoed our "failure" then there was a real risk that the senior stakeholders would have mistakenly thinking everything was fine and now action was needed, which would likely have resulted in a complete failure of the project to deliver. Some people seem to like to always paint a positive picture to their seniors (the RAG reports that are always yellow until it's too late to fix anything and they finally all go red, as they people go and get new jobs elsewhere...).

### Setting the standards

Nobody wants bugs, unmaintainable spaghetti code, regressions due to missing test coverage. But how do you achieve this in a collaborative positive way? Just demanding it be so is ineffective and builds resentment.

No team is perfect. No software is perfect. There is only "better", "worse" and different tradeoffs between different pressures on system design and human behaviour. So we should strive for the best, bring the team with us, and accept that we are all flawed human beings with an inability to simultaneously keep in our heads every constraint and piece of the system. In fact software is largely written and architected the way it is *because* even the best human brains have limited capacity for knowledge of a system. Managing complexity and coping gracefully with humans being human is an important part of the puzzle.

I see the push towards today and tomorrow's "best practice" more as giving permission to the team to strive for it than enforcing. Most developers I know want to be and do the absolute best they can. When team output doesn't meet some criteria (such as test coverage) these are some possible reasons that I'd look at. I'd use the ordering below so that we can assume good faith until proven wrong. I definitely wouldn't start with confrontation or accusation. Assuming the best does not mean giving up powers of last resort should all other options be exhausted, but that would be the last option. Filtering for great people on the way in is much better than undoing poor selection once the team is up and running.

1. What pressures are being placed on a contributor to behave a particular way, where is that coming from? E.g. is a delivery manager pushing for raw speed and that being interpreted as a need to skip test coverage and just ship bare production code. In that case perhaps some conversations about the tradeoffs being invisibly made are all that it would take, and some defense of the fundamentals that drive the need for "best practice" in the first place (e.g. regression-proofing to allow continuous delivery, and confidence in refactoring to support agility and ongoing quality, see also [XP](https://en.wikipedia.org/wiki/Extreme_programming))
2. Is there a lack of knowledge as to why this good practice is beneficial to the project? If so some mentoring and coaching might be in order. Maybe as part of some pair programming exercises.
3. Provide formal training (perhaps Pluralsight courses) to fill in the knowledge gaps. Particularly for permanent employees. For contractors perhaps a suggestion of courses they could take to level-up.
4. Communicating to those involved in line management / supplier management the concerns with not meeting the standards the rest of the team are able to achieve. Discussing additional ways of providing support to enable the individual to level-up.
5. Finally and this is not a preferred option due to the disruption it causes make the call to formally put someone on a formal improvement plan or move them on.

#### The coaching ladder

Inspired by [Developing Leadership podcast episode 19 about a strong engineering leadership culture](https://www.developingleadership.co/episode/episode-19-transitioning-from-a-holacracy-to-a-strong-engineering-leadership-culture-with-katie-wilde-from-ambassador-labs#).

Different people, cultures and neurological wiring need different ways of setting out expectations. A two-pronged approach of gentle coaching + clear expectation & consequence setting seems to cover all bases.

1. Listening mode - make sure people are heard in groups and one-on-one
2. Gently coach expectations - "have you thought about doing x?" / "I observe that your PR descriptions average 10 words" / "here's how writing clear PR descriptions helps your valuable ideas be recognised by the team"
3. Set out consequences of not meeting expectations - "We require excellent communication in pull requests to the standard of [example]" / "this standard is a requirement of continuing to be a senior engineer here"

#### One-minute manager

Where course correction is needed (when operating more as a line-manager) [The (new) One Minute Manager](https://www.amazon.co.uk/New-One-Minute-Manager/dp/0008128049) offers some great advice on keeping it simple and clear for all involved. This suggests that one-to-one interactions take the form of:

1. One-minute on goals
2. One-minute on praise
3. One-minute on redirection

If doing only three minutes of this means they can be done more often and more reliably with the whole team this is a win, as often the opportunity for this kind of discussion is lacking due to the pressure to ship. It's important to note that this doesn't mean the relationship has reverted to command and control, only that clear expectations are important for everyone's success and happiness.

### Current "Best Practice" and Lofty Goals

Things we should strive towards doing/having.

* Great test coverage
	* 100% unit test coverage (in meaning not just in line count)
		* Why? Because this enables refactoring with confidence, reduces the chance of regressions and encourages good design (e.g. decoupling, SOLID etc.)
	* Use TDD (Test-Driven Development)... if it's the right tool for the job. TDD is a useful technique to be sure. It's harder to use when you can't picture the shape of what you are going to create in your head in advance which I think is probably its biggest weakness. The ultimate objective is that it should be impossible to change the intended behaviour of a production code without a test failing. TDD helps with this but isn't the only way. Another way is to alter the behaviour temporarily (locally) after the code is written and make sure the tests do actually fail. So long as the output coverage is good then I don't personally think that being religious about TDD is especially helpful. I think it's a technique that all developers should learn and practice, whether or not they use it for every piece of code they write.
	* Smoke tests
		* Some kind of end-to-end "did we break anything critical" that runs on real infrastructure. This usually requires dedicated effort to create beyond the tests created during individual feature work. I recommend putting this in the backlog and ensuring it is scheduled as it's too big for a hero-developer to "just do" unless you've completely lost control.
		* [Visual regression testing](https://www.browserstack.com/guide/visual-regression-testing) - in anything with a UI this can catch regressions and unintentional changes that would be hard to catch.
	* ["BDD" (Behaviour Driven Development) aka specification by example](https://www.agilealliance.org/glossary/bdd/)
  	* A tool for a job. Use it where it's useful such as allowing business analysts to create and validate example scenarios for complex calculations or flows. Beware of the overhead of example wiring code.
  	* Often confused with UI tests due to coincidental timing of creation with browser-automation. BDD is not the same as UI testing, mkay?
	* The point of BDD is more that it's a user/business need focussed description of what the software is supposed to do that's then made executable through a translation layer. Do not forget this.
	* You can get a lot of the benefit of BDD by [just writing test method names in the BDD style](https://www.futurelearn.com/info/blog/how-we-write-readable-feature-tests-with-rspec), such as `def the_order_total_should_be(total_price)` and then chaining them together in a top level "scenario" method just like you would with gherkin but without all the example parsing overhead.
* Continuous delivery (and confidence to ship any time without even looking)
	* [Lights-Out delivery](https://sdtimes.com/devops/going-lights-out-with-devops/) - i.e. never having to manually interact with production servers. Related to configuration-as-code etc.
	* Use feature flags (related to the true meaning of the oft misused phrase "continuous integration") to avoid long-lived feature branches for things you can't release to the users yet.
* Use the best type of project management (yes I used the dirty words!) for *your* project.
	* Agility:
		* Methodologies are fine, but the point is to be able to be responsive to changing knowledge and business requirements. Never forget that.
		* [eXtreme Programming](http://www.extremeprogramming.org/) - an important piece of the landscape, with a focus on technical approaches that allow agility (always shippable, fully tested, etc.)
		* [Scrum](https://www.scrum.org/resources/what-is-scrum/) - a good basis for all projects, especially greenfield development
		* Kanban - better for maintenance mode projects
			* It's very important to understand "Work In Progress (WIP) limits" regardless of whether you use kanban or not. [This video explains wip limits](https://youtu.be/W92wG-HW8gg) in a way that is easily understandable. The mathematically truth of wip limits will always be counter-intuitive to my monkey-brain I think. In short, throughput matters more than utilisation of each person/resource.
		* Lean
		* [Flow](https://flowacademy.io/what-is-flow/)
		* [Scaled Agile (SAFe)](https://www.scaledagileframework.com/) for multi-team agile
		* ShapeUp from basecamp is inspirational. It's a refreshing change from scrum. I wrote [a summary of ShapeUp](/2019/11/26/time-to-shape-up-your-scrum-process-the-new-thing-from-basecamp/) which, in my humble opinion, is worth a read.
		* Waterfall is bad. Period. Gantt charts are to be treated with suspicion, along with anyone and anything else that promises complete predictability of software development.
		* Self-directed teams that own their results and can use appropriate methods for their particular challenges are far more effective than standardization.
		* Personally I like some kind of blend of scrum and kanban, and definitely no story pointing.
* Lightweight agile governance:
	* Stakeholders showing up to sprint demos (show-n-tell) is much more time-efficient and more powerful than written reports.
* Ability to rebuild entire estate from source-control:
	* Binaries
	* Infrastructure (configuration-as-code)
* DevOps in practice not just in name (the development team **owning** production)
  * This implies a diversity of skills within the "development" team.
  * Assistance from people with expertise outside the team is of course welcome, but the important thing is the team continues to own their own outcomes.
* Some (but not complete) harmonization of technology choices:
	* Largely consistent technology makes hiring and moving around projects easier
	* Completely consistent technology prevents using the best tool for the job
* Following [12 factor principles](https://12factor.net/).
	* Pushing beyond the original 12 factor principles - [Small Batches podcast episode 7](https://smallbatches.fm/7/)
	* Continuous improvement (of the team, the processes and the system being built)
* Pair/mob programming.
  * Collaborating on just about everything ensures no-one is a single point of knowledge for any one thing.
  * The sharing of knowledge, skills and techniques improves everyone's skills as we go.
  * Many problems and bugs are caught even before `git add` has been run. The later a problem is found the more it costs to rectify it.

### Estimates

*Story points, t-shirt sizes, predictions, time-based estimates and no-estimates.*

This is a topic that always causes heated debate with lots of dogma on all sides. Experiences of day-long point-guessing sessions leave developers who just want to ship nervous of anyone who mentions the word estimate or point. Project owners/managers get nervous when they have no idea how much they are about to spend. Deadlines can be real or made up. Cost/benefit decisions have to be made. So what should we do?

I say it depends. And more usefully, **only create estimates if you can prove you need them**, and then use the most lightweight way you can come up with of getting just enough information to make a call and go back to cutting code.

Creating estimates has a cost, make sure you know you need it otherwise don't pay the price. Kanban calls this "[waste](https://kanbanize.com/lean-management/value-waste/7-wastes-of-lean)" (i.e. anything that doesn't end up in the final product, which definitely includes estimation work).

[Avoid story points](https://ronjeffries.com/articles/019-01ff/story-points/Index.html) - they were basically invented as a way to prevent people mistaking **estimates** for **commitments** but have taken on a horrifying life of their own. I have *never* seen them be particularly useful in any of the many projects I've been on, and I have regularly seen them be a big cause of pain, wasted time and discontentment.

Genuine reasons for needing some kind of estimate:

* Big-feature prioritization - use t-shirt sizes (small, medium, large, elephant)
* Can't miss deadline (I arrived on a project when the release date of a non-existent thing had already been announced by the managing director to all the customers). Do as few of the following as you can: (listed in increasing order of cost and decreasing order of preference.)
	* A "finger in the air" hunch for viability of the project from an experienced engineer
  * Consider just doing the minimum viable product (MVP) first and then adding nice to haves once that's done (iterate). Focus on always-shippable.
  * If you are concerned even the smallest viable thing might not be doable then you might have to create some architecture designs and prototypes up-front to reduce risk of discovering complications later.
  * If time is tight and even the MVP is looking uncertain then you might have to create actual estimates for more detailed tasks to give you a better idea of the options ahead of you. I have actually done this on a fixed-deadline project. It's time consuming and dangerously waterfall but it might be your only choice. The more granular the task list the more accurate the estimate (it helps compensate for human bias), but on the flip side the more detail you create without building the more likely you are to be wrong about the design and tasks and for it all to be a waste.
 
Planning releases - do you *really* need to do this give the cost? Consider using feature-flags instead to hold back features if you need to time their release.


If you need to forecast based on points [use monte-carlo story-point forecasting as implemented by Chris Bimson](https://christopher-bimson.github.io/blog/2017/04/19/forecaster). While I like this approach I'd challenge the need for the forecasts in the first place before committing to the significant extra overhead of calculating and tracking points and then turning that into forecast.

### Staying sharp

Even though I accidentally led a couple of teams early in my contracting career I didn't at that point fancy moving "up" the ladder. I had seen people become "dev team managers" and rapidly lose all their technical skills through a combination of atrophy and the never-ending churn in state-of-the-art technology and practice. I certainly didn't want to end up us a mediocre manager with mediocre and outdated tech skills. So I put my head down and kept on coding as an "individual contributor" (sometimes referred to as an I.C.). Since then I've learned and seen some tricks that I think can allow people to stay sharp no matter how high they climb.

#### The pendulum

By alternating roles you take on between individual contributor (coder) and team lead roles you can keep the experience of coal-face high-pace shipping fresh whilst also giving more value by helping whole teams succeed.

<https://charity.wtf/2017/05/11/the-engineer-manager-pendulum/>

#### The non-critical-path task

I tried picking up a story from the sprint when I was leading a team once. It didn't go well but I didn't know any better. Because my primary goal was team enablement and my time was interrupt-driven I'd end up with the team waiting for my piece to get done. Not a great help to the team's delivery speed. I also found with the team being full time on code and me less than full time I was always just that little bit behind on current thinking in the heart of the codebase, and you don't have to be much out of step to be much less productive or cause more problems than you solve.

Since then I've seen two great approaches implemented by others:

1. Take on a non-critical but useful coding piece that won't block the team. I watched an amazing product owner (who can also code) built an entire support console microservice while us devs built the main production app. This gave huge benefit of allowing the support folks and BAs to self-serve on things we didn't have time to build to production grade. It kept him close to the actual product. It also kept his Ruby on Rails skills current and sharp. Ace. I shall be copying this trick!
2. Work on enablement pieces. Make sure CI pipelines are flowing well. Do version upgrades. Tackle bugs that haven't made the team's sprint. I've seen a team lead do this effectively and would recommend.

### Interviewing / filtering

Not everyone gets this luxury but being allowed to control who works in your team will do more for your ability to succeed than anything else.

For a phone screen I wrote up my process here: [Technical phone screen interview questions](/2021/12/10/technical-phone-screen-interview-questions/).

Beyond a quick phone/video screen my favourite approach is a pair-programming exercise as this is such a rich source of information and matches how we actually get things done.

### Coaching & mentoring

I can't say it better than [The Coaching Habit by Michael Bungay Stanier](https://www.amazon.co.uk/Coaching-Habit-Less-Change-Forever/dp/B01HH7IZCI). The follow-up book [The Advice Trap](https://www.amazon.co.uk/How-Tame-Your-Advice-Monster/dp/1989025757) is also excellent.

I've often been guilty of unloading all my "knowledge" on others before they've even asked. Now I see the error of my ways and instead as per the book look to nudge and help at people's own pace. Being there to assist and give confidence as needed; leading people to the best answer through questions instead of answers (and being happy to be surprised that it's a better answer than I had in mind).

### Decision making

It's good to have single points of responsibility such as a tech lead or project owner, however that doesn't mean that it's top down control.

As for how to make the best decisions in chaos and complexity, or when thinking seems to have narrowed to group-think this is an excellent guide: [Decisive: How to Make Better Choices in Life and Work by Chip & Dan Heath](https://www.amazon.co.uk/Decisive-Make-Better-Choices-Life/dp/0307956393)


### Things to read / watch / listen too

* Blog posts
	* [Maker's Schedule, Manager's Schedule by Paul Graham](http://paulgraham.com/makersschedule.html)
	* [Being Glue post/talk by Tanya Reilly](https://noidea.dog/glue)
	* [Command and Conquer and the Herd of Coconuts by Joel Spolsky](https://www.joelonsoftware.com/2000/03/23/command-and-conquer-and-the-herd-of-coconuts/)
	* [Normalization of deviance by Dan Luu](https://danluu.com/wat/)
*  Tech leadership books
	* [Notes to a Software Team Leader: Growing Self Organizing Teams by Roy Osherove](https://www.amazon.co.uk/Notes-Software-Team-Leader-Organizing/dp/829993320X)
* General leadership & communication books
	* [The Advice Trap: Be Humble, Stay Curious & Change the Way You Lead Forever by Michael Bungay Stanier](https://www.amazon.co.uk/Advice-Trap-Humble-Curious-Forever-ebook/dp/B083YZTW4B)
	* [5 Dysfunctions of a Team](https://www.audible.co.uk/pd/The-Five-Dysfunctions-of-a-Team-Audiobook/B004EXKC5M)
	* [The First 90 Days](https://www.audible.co.uk/pd/The-First-90-Days-Updated-and-Expanded-Audiobook/B00CDW0EX6)
* Personal development (you'll need this for you and your team!)
	* [Daring Greatly by Brené Brown](https://www.amazon.co.uk/Daring-Greatly-Courage-Vulnerable-Transforms-ebook/dp/B00APRW2WC)
	* [Nonviolent Communication; Marshall Rosenberg](https://www.amazon.co.uk/Nonviolent-Communication-Create-Relationships-Harmony/dp/B00TIWFAV0/)
	* [Bonds That Make Us Free; C. Terry Warner](https://www.amazon.co.uk/Bonds-That-Make-Free-Relationships/dp/B07N149VZK/)
	* [48 Laws of Power; Robert Greene](https://www.amazon.co.uk/48-Laws-of-Power/dp/B00WYRC0L4/)
* Lean / Flow / Kanban agile etc
  * [The Goal: A Process of Ongoing Improvement Kindle Edition
by Eliyahu M. Goldratt](https://www.amazon.co.uk/Goal-Process-Ongoing-Improvement-ebook/dp/B002LHRM2O) (Audible version has sound effects and everything!)
  * [WIP: why limiting work in progress makes sense (Kanban) (YouTube)](https://www.youtube.com/watch?v=W92wG-HW8gg)

(Personally I like Audible books, I think it sinks in better being told the stories by another human voice)


### Who to learn from

* The legend of [Joel Spolsky](https://www.joelonsoftware.com/) - I've been reading his articles since I first started coding. Remember "[the joel test](https://www.joelonsoftware.com/2000/08/09/the-joel-test-12-steps-to-better-code/)"?

## Other ways of moving "up"

These days thankfully moving into management isn't the only way to get a pay raise in many organisations. Places have recognised that getting ever deeper into technology is in itself valuable, spawning titles such as "principle engineer" that carry the weight and renumeration to match the value and experience of a coder who has seen many things and developed many other skills beyond pure coding.

There's also the "architect" route where you can be an expert in deciding what to use and how to put it together from the seemingly infinite choice of technical solutions, patterns, services and infrastructure that will solve pretty much any given problem. There's good money to be made being an architect, if nothing else than because your power to royally screw everything up for everyone that comes after you is probably about as high as it gets in this role! (Yes I've been on the receiving end of good and bad "architecture").

The road to CTO. You can join a small startup and ride the explosive growth, ending up with many engineers and services under your control. Or you can work your way up relentlessly in one or more large organisations.

## Me, a leader?

### Why me, why now, why this?

I'd like to build a product, but I can't just stop contracting and hope for the best. As such I've spent some time considering which direction I should take my contractor life.

When considering changes of career direction I highly recommend [the book "Working Identity" by Herminia Ibarra](https://www.amazon.co.uk/Working-Identity-Unconventional-Strategies-Reinventing-ebook/dp/B004OEIQ7C) which lays out a framework for thinking about the journey of the change, combined with lots of research and stories of others who've faced the chasm (often but not exclusively in the traditional mid-life point).

Here's some ideas that popped up ("identities to try on" in the terminology of the book):

* **Systems-integration agency/consultancy** - I had a go at this but seems to be too big a jump for me right now, on the plus side it's kicked off another period of learning and self-development for me and is the reason I hired a [business coach](https://businesscoachdirectory.com/coaches/) which I am eternally grateful for.
* **Become a "frontend" engineer** - Traditionally I've been a "full stack" or "backend" engineer which fits my engineering strengths of dealing with complexity in code (for example [tech debt as discussed here](/2020/07/09/approaches-to-refactoring-and-technical-debt/)). Way back there wasn't much complexity beyond a bit of jQuery in most frontend things, in fact I didn't come across the frontend/backend specialization for many years. For a long time the designers-who-can-html dominated frontend land. But these days with ES6, Typescript, npm, angular, react, etc. etc. there is now endless complexity on the frontend for someone like me to get my teeth into. With that in mind (and with a view to improving my ability to ship side-projects) I've been updating my languishing frontend skills. (There's not much frontend in my recent work for UK Gov as that's pretty much templated out with the [gov.uk design system](https://design-system.service.gov.uk/), and accessibility concerns means that fancy responsive SPAs don't tend to pass muster). Having put the idea out there with recruiters etc. but not getting much interest I think it's probably a jump too far in one go, but either way I'll spend some spare time skilling up.
* **Lead developer** - I don't really know why I didn't think of this sooner, it's actually a good fit for where I've been and where my life is at now. This is my current identity to try on, wish me luck! The rest of this post is about this.

Here's why I like the team lead idea right now:

I think can provide more value as a contract team-lead for dotnet delivery teams. I can still crank code, and still enjoy coding, but helping a whole team succeed is a worthy thing.

The higher rates would make up for it being a less commonly available role (there's always at least two individual contributors for every team lead, and leads are less commonly contractors). And I could always fill in with coder work in any gaps.

Thinking back to my history and current position, I've enjoyed the lead roles I've done, I love enabling those around me, and I've learned some tricks for being able to stay close to the tech without getting in the way (see "staying sharp" above). I can still crank code, but it seems a shame to learn everything I have beyond the code and then not put it into practice.

### Experience leading

One of my earliest contracts was a project where I was brought in as a solo dev with a view to delivering an asp.net project. The first task was to collect the requirements from a sales person (not an end user or user researcher sadly but that's how it was). So armed with my new love of [balsamiq mockups](https://balsamiq.com/) I set about turning the explained needs into a set of wireframes, using them as a tool for a tool for discussion and iterating them as I better understood the problem at hand. I then started work building. After some time the CTO sauntered over and casually asked how likely we were to meet the publicised launch date now that we understood what needed to be built. "Zero" I said, as this was quite a sizeable thing on a not particularly long timeline. A lovely chap to work with he didn't pass further comment and disappeared again.

Not much later I found myself with a team to work on the project consisting of a mix of permanent development staff who'd been reassigned to the project. Because I was there first and I was in touch with the people relaying user's needs I was naturally the hub for the team. Additionally I was one of the few who'd practiced agile methods in previous roles. The result was I felt it was far more important that I enabled the rest of my team to be as productive as possible by eliminating things that were blocking them as my top priority. So there I was, being a team lead for a dev team building a new product, making sure everyone was able to get on, talking to stakeholders and running our sprint demos to ensure everyone inside and outside the project team understood how it was going and could play their part. Pleasingly we shipped a usable system in time for the deadline.

### Experience mentoring

I've always helped everyone I can be the best they can, freely sharing knowledge with anyone who's interested. Not just developers either, in my view the more non-technical roles know about the thing we're all working on the more effective they can be.

I officially mentored DfE Digital's first civil-servant developer which was a real pleasure. You can hear a bit more about that on [my podcast episode "A retrospective of mentoring, with David Gisbey"](https://pod.timwise.co.uk/10)

## Summary

Well that was a lot more than I expected when I sat down to write, guess there's a lot floating around my head after 21 years thinking, doing and learning.

Wish me luck, and I hope this helps you in some way.

If you want my help with a team just get in touch, I'm always happy to chat.
